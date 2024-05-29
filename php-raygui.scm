(module php-raygui
    (load (php-macros "/usr/local/lib/php-macros.scm"))
    (load (raylib-macros "../bpc-ext-raylib/raylib-macros.scm"))
    (extern
        (include "raygui.c"))
    (export
        (init-php-raygui-lib)
        ; constants
        RAYGUI_VERSION_MAJOR
        RAYGUI_VERSION_MINOR
        RAYGUI_VERSION_PATCH
        RAYGUI_VERSION
        ; enum GuiControl
        GUI_CONTROL_DEFAULT
        ; enum GuiDefaultProperty
        TEXT_SIZE
        TEXT_SPACING
        LINE_COLOR
        BACKGROUND_COLOR
        TEXT_LINE_SPACING
        TEXT_ALIGNMENT_VERTICAL
        TEXT_WRAP_MODE
        ; Style set/get functions
        (guisetstyle control property value)
        (guigetstyle control property)
        ; Container/separator controls, useful for controls organization
        (guiwindowbox bounds title)
        (guigroupbox bounds text)
        (guiline bounds text)
        (guipanel bounds text)
        (guitabbar bounds tabs active)
        (guiscrollpanel bounds text content scroll view)
        ; Basic controls set
        (guibutton bounds text)
        ; Advance controls set
        (guimessagebox bounds title message buttons)
        ))

(define (init-php-raygui-lib)
    #t)

(register-extension "raygui"        ; extension title, shown in e.g. phpinfo()
                    PHP_VERSION     ; version
                    "php-raygui")   ; library name. make sure this matches LIBNAME in Makefile

; constants

(defconstant RAYGUI_VERSION_MAJOR   (pragma::elong "RAYGUI_VERSION_MAJOR"))
(defconstant RAYGUI_VERSION_MINOR   (pragma::elong "RAYGUI_VERSION_MINOR"))
(defconstant RAYGUI_VERSION_PATCH   (pragma::elong "RAYGUI_VERSION_PATCH"))
(defconstant RAYGUI_VERSION         (pragma::string "RAYGUI_VERSION"))

; enum GuiControl

(defconstant GUI_CONTROL_DEFAULT (pragma::elong "DEFAULT"))

; enum GuiDefaultProperty

(defconstant TEXT_SIZE                  (pragma::elong "TEXT_SIZE"))
(defconstant TEXT_SPACING               (pragma::elong "TEXT_SPACING"))
(defconstant LINE_COLOR                 (pragma::elong "LINE_COLOR"))
(defconstant BACKGROUND_COLOR           (pragma::elong "BACKGROUND_COLOR"))
(defconstant TEXT_LINE_SPACING          (pragma::elong "TEXT_LINE_SPACING"))
(defconstant TEXT_ALIGNMENT_VERTICAL    (pragma::elong "TEXT_ALIGNMENT_VERTICAL"))
(defconstant TEXT_WRAP_MODE             (pragma::elong "TEXT_WRAP_MODE"))

; Style set/get functions

(defbuiltin (guisetstyle control property value)
    (unless (elong? control)
        (set! control (mkelongw 'GuiSetStyle 1 control)))
    (when control
        (unless (elong? property)
            (set! property (mkelongw 'GuiSetStyle 2 property)))
        (when property
            (unless (elong? value)
                (set! value (mkelongw 'GuiSetStyle 3 value)))
            (when value
                (pragma "GuiSetStyle((int)$1, (int)$2, (int)$3)"
                        ($belong->elong control)
                        ($belong->elong property)
                        ($belong->elong value))
                NULL))))

(defbuiltin (guigetstyle control property)
    (unless (elong? control)
        (set! control (mkelongw 'GuiGetStyle 1 control)))
    (when control
        (unless (elong? property)
            (set! property (mkelongw 'GuiGetStyle 2 property)))
        (when property
            (pragma::elong "GuiGetStyle((int)$1, (int)$2)"
                           ($belong->elong control)
                           ($belong->elong property)))))

; Container/separator controls, useful for controls organization

(define-macro (%with-c-bounds func-name . code)
    `(begin
        (pragma "Rectangle bounds")
        (when (%init-c-rect ,func-name 1 bounds "bounds")
            ,@code)))

(define-macro (%with-c-text-list func-name arg-idx arg . code)
    `(begin
        (pragma "const char **text = NULL;
                 int count = 0")
        (unless (null? ,arg)
            (set! ,arg (mkhashw ,func-name ,arg-idx ,arg))
            (when ,arg
                (let ((size (php-hash-size ,arg)))
                    (when (>fx size 0)
                        (pragma "text = (const char **)GC_MALLOC_ATOMIC(sizeof(char *) * $1)"
                               ($bint->int size))
                        (let loop ((t (php-hash-reset ,arg 'cont)))
                            (when t
                                (set! t (container-value t))
                                (unless (string? t)
                                    (set! t (or (mkstr t 'arg-parsing)
                                                (php-error ,func-name "() expects parameter " ,arg-idx " to be array of strings, " (get-php-datatype t 'arg-parsing) " given"))))
                                (when t
                                    (pragma "text[count++] = $1" ($bstring->string t)))
                                (loop (php-hash-advance ,arg 'cont))))
                        (pragma "if (count == 0) {
                                    text = NULL;
                                 }")))))
        ,@code))

(defbuiltin (guiwindowbox bounds title)
    (%with-c-bounds 'GuiWindowBox
        (unless (string? title)
            (set! title (mkstrw 'GuiWindowBox 2 title)))
        (when title
            (pragma::bool "GuiWindowBox(bounds, $1)" ($bstring->string title)))))

(defbuiltin (guigroupbox bounds (text NULL))
    (%with-c-bounds 'GuiGroupBox
        (if (null? text)
            (pragma::bool "GuiGroupBox(bounds, NULL)")
            (begin
                (unless (string? text)
                    (set! text (mkstrw 'GuiGroupBox 2 text)))
                (when text
                    (pragma::bool "GuiGroupBox(bounds, $1)" ($bstring->string text)))))))

(defbuiltin (guiline bounds (text NULL))
    (%with-c-bounds 'GuiLine
        (if (null? text)
            (pragma::bool "GuiLine(bounds, NULL)")
            (begin
                (unless (string? text)
                    (set! text (mkstrw 'GuiLine 2 text)))
                (when text
                    (pragma::bool "GuiLine(bounds, $1)" ($bstring->string text)))))))

(defbuiltin (guipanel bounds (text NULL))
    (%with-c-bounds 'GuiPanel
        (if (null? text)
            (pragma::bool "GuiPanel(bounds, NULL)")
            (begin
                (unless (string? text)
                    (set! text (mkstrw 'GuiPanel 2 text)))
                (when text
                    (pragma::bool "GuiPanel(bounds, $1)" ($bstring->string text)))))))

(defbuiltin (guitabbar bounds tabs (ref . active))
    (%with-c-bounds 'GuiTabBar
        (%with-c-text-list 'GuiTabBar 2 tabs
            (let ((active-idx (container-value active)))
                (unless (elong? active-idx)
                    (set! active-idx (mkelongw 'GuiTabBar 3 active-idx)))
                (when active-idx
                    (pragma "int active")
                    (pragma "active = (int)$1" ($belong->elong active-idx))
                    (pragma "int result = GuiTabBar(bounds, text, count, &active)")
                    (container-value-set! active (pragma::elong "active"))
                    (pragma::elong "result"))))))

(defbuiltin (guiscrollpanel bounds text content (ref . scroll) ((ref . view) unpassed))
    (%with-c-bounds 'GuiScrollPanel
        (unless (or (null? text)
                    (string? text))
                (set! text (mkstrw 'GuiScrollPanel 2 text)))
        (when text
            (pragma "Rectangle content")
            (when (%init-c-rect 'GuiScrollPanel 3 content "content")
                (pragma "Vector2 scroll = {0.0f, 0.0f}")
                (when (let ((scroll-val (container-value scroll)))
                        (or (null? scroll-val)
                            (%init-c-vector2 'GuiScrollPanel 4 scroll-val "scroll")))
                    (pragma "Rectangle view = {0}")
                    (when (or (eq? view unpassed)
                              (let ((view-val (container-value view)))
                                (or (null? view-val)
                                    (%init-c-rect 'GuiScrollPanel 5 view-val "view"))))
                        (pragma "int result")
                        (pragma "result = GuiScrollPanel(bounds, STRINGP($1) ? BSTRING_TO_STRING($1) : NULL, content, &scroll, &view)"
                                text)
                        (unless (eq? scroll unpassed)
                            (container-value-set! scroll (%mkvector2-v "scroll")))
                        (unless (eq? view unpassed)
                            (container-value-set! view (%mkrect-r "view")))
                        (pragma::bool "result")))))))

; Basic controls set

(defbuiltin (guibutton bounds text)
    (pragma "Rectangle bounds")
    (when (%init-c-rect 'GuiButton 1 bounds "bounds")
        (unless (string? text)
            (set! text (mkstrw 'GuiButton 2 text)))
        (when text
            (pragma::bool "GuiButton(bounds, $1)" ($bstring->string text)))))

; Advance controls set

(defbuiltin (guimessagebox bounds title message buttons)
    (pragma "Rectangle bounds")
    (when (%init-c-rect 'GuiMessageBox 1 bounds "bounds")
        (unless (string? title)
            (set! title (mkstrw 'GuiMessageBox 2 title)))
        (when title
            (unless (string? message)
                (set! message (mkstrw 'GuiMessageBox 3 message)))
            (when message
                (unless (string? buttons)
                    (set! buttons (mkstrw 'GuiMessageBox 4 buttons)))
                (when buttons
                    (pragma::elong "GuiMessageBox(bounds, $1, $2, $3)"
                                   ($bstring->string title)
                                   ($bstring->string message)
                                   ($bstring->string buttons)))))))
