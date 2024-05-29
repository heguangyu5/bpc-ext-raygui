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
        ; Controls
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

; Controls

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
