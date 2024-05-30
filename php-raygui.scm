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
        (guilabel bounds text)
        (guibutton bounds text)
        (guilabelbutton bounds text)
        (guitoggle bounds text active)
        (guitogglegroup bounds text active)
        (guitoggleslider bounds text active)
        (guicheckbox bounds text checked)
        (guicombobox bounds text active)
        (guidropdownbox bounds text active editMode)
        (guispinner bounds text value minValue maxValue editMode)
        (guivaluebox bounds text value minValue maxValue editMode)
        (guitextbox bounds textBuf filledLen editMode)
        (guislider bounds textLeft textRight value minValue maxValue)
        (guisliderbar bounds textLeft textRight value minValue maxValue)
        (guiprogressbar bounds textLeft textRight value minValue maxValue)
        (guistatusbar bounds text)
        (guidummyrec bounds text)
        (guigrid bounds spacing subdivs mouseCell)
        ; Advance controls set
        (guilistview bounds text scrollIndex active)
        (guilistviewex bounds items scrollIndex active focus)
        (guimessagebox bounds title message buttons)
        (guitextinputbox bounds title message buttons textBuf filledLen secretViewActive)
        (guicolorpicker bounds text color)
        (guicolorpanel bounds text color)
        (guicolorbaralpha bounds text alpha)
        (guicolorbarhue bounds text value)
        (guicolorpickerhsv bounds text colorHsv)
        (guicolorpanelhsv bounds text colorHsv)
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

; return #t if close button clicked
(defbuiltin (guiwindowbox bounds title)
    (%with-c-bounds 'GuiWindowBox
        (unless (string? title)
            (set! title (mkstrw 'GuiWindowBox 2 title)))
        (when title
            (pragma::bool "GuiWindowBox(bounds, $1)" ($bstring->string title)))))

(defbuiltin (guigroupbox bounds (text NULL))
    (%with-c-bounds 'GuiGroupBox
        (if (null? text)
            (begin
                (pragma "GuiGroupBox(bounds, NULL)")
                NULL)
            (begin
                (unless (string? text)
                    (set! text (mkstrw 'GuiGroupBox 2 text)))
                (when text
                    (pragma "GuiGroupBox(bounds, $1)" ($bstring->string text))
                    NULL)))))

(defbuiltin (guiline bounds (text NULL))
    (%with-c-bounds 'GuiLine
        (if (null? text)
            (begin
                (pragma "GuiLine(bounds, NULL)")
                NULL)
            (begin
                (unless (string? text)
                    (set! text (mkstrw 'GuiLine 2 text)))
                (when text
                    (pragma "GuiLine(bounds, $1)" ($bstring->string text))
                    NULL)))))

(defbuiltin (guipanel bounds (text NULL))
    (%with-c-bounds 'GuiPanel
        (if (null? text)
            (begin
                (pragma "GuiPanel(bounds, NULL)")
                NULL)
            (begin
                (unless (string? text)
                    (set! text (mkstrw 'GuiPanel 2 text)))
                (when text
                    (pragma "GuiPanel(bounds, $1)" ($bstring->string text))
                    NULL)))))

; return tab index to be closed
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
                        (pragma "GuiScrollPanel(bounds, STRINGP($1) ? BSTRING_TO_STRING($1) : NULL, content, &scroll, &view)"
                                text)
                        (unless (eq? scroll unpassed)
                            (container-value-set! scroll (%mkvector2-v "scroll")))
                        (unless (eq? view unpassed)
                            (container-value-set! view (%mkrect-r "view")))
                        NULL))))))

; Basic controls set

(defbuiltin (guilabel bounds text)
    (%with-c-bounds 'GuiLabel
        (unless (string? text)
            (set! text (mkstrw 'GuiLabel 2 text)))
        (when text
            (pragma "GuiLabel(bounds, $1)" ($bstring->string text))
            NULL)))

; return #t if button clicked
(defbuiltin (guibutton bounds text)
    (%with-c-bounds 'GuiButton
        (unless (string? text)
            (set! text (mkstrw 'GuiButton 2 text)))
        (when text
            (pragma::bool "GuiButton(bounds, $1)" ($bstring->string text)))))

; return #t if label button clicked
(defbuiltin (guilabelbutton bounds text)
    (%with-c-bounds 'GuiLabelButton
        (unless (string? text)
            (set! text (mkstrw 'GuiLabelButton 2 text)))
        (when text
            (pragma::bool "GuiLabelButton(bounds, $1)" ($bstring->string text)))))

(defbuiltin (guitoggle bounds text (ref . active))
    (%with-c-bounds 'GuiToggle
        (unless (string? text)
            (set! text (mkstrw 'GuiToggle 2 text)))
        (when text
            (let ((active-val (container-value active)))
                (unless (boolean? active-val)
                    (set! active-val (mkboolw 'GuiToggle 3 active-val)))
                (when (boolean? active-val)
                    (pragma "bool active")
                    (pragma "active = $1 == BTRUE" active-val)
                    (pragma "GuiToggle(bounds, $1, &active)" ($bstring->string text))
                    (container-value-set! active (pragma::bool "active"))
                    NULL)))))

(defbuiltin (guitogglegroup bounds text (ref . active))
    (%with-c-bounds 'GuiToggleGroup
        (unless (string? text)
            (set! text (mkstrw 'GuiToggleGroup 2 text)))
        (when text
            (let ((active-idx (container-value active)))
                (unless (elong? active-idx)
                    (set! active-idx (mkelongw 'GuiToggleGroup 3 active-idx)))
                (when active-idx
                    (pragma "int active")
                    (pragma "active = (int)$1" ($belong->elong active-idx))
                    (pragma "GuiToggleGroup(bounds, $1, &active)" ($bstring->string text))
                    (container-value-set! active (pragma::elong "active"))
                    NULL)))))

; return #t when clicked
(defbuiltin (guitoggleslider bounds text (ref . active))
    (%with-c-bounds 'GuiToggleSlider
        (unless (string? text)
            (set! text (mkstrw 'GuiToggleSlider 2 text)))
        (when text
            (let ((active-idx (container-value active)))
                (unless (elong? active-idx)
                    (set! active-idx (mkelongw 'GuiToggleSlider 3 active-idx)))
                (when active-idx
                    (pragma "int active")
                    (pragma "active = (int)$1" ($belong->elong active-idx))
                    (pragma "int result")
                    (pragma "result = GuiToggleSlider(bounds, $1, &active)" ($bstring->string text))
                    (container-value-set! active (pragma::elong "active"))
                    (pragma::bool "result"))))))

(defbuiltin (guicheckbox bounds text (ref . checked))
    (%with-c-bounds 'GuiCheckBox
        (unless (string? text)
            (set! text (mkstrw 'GuiCheckBox 2 text)))
        (when text
            (let ((checked-val (container-value checked)))
                (unless (boolean? checked-val)
                    (set! checked-val (mkboolw 'GuiCheckBox 3 checked-val)))
                (when (boolean? checked-val)
                    (pragma "bool checked")
                    (pragma "checked = $1 == BTRUE" checked-val)
                    (pragma "GuiCheckBox(bounds, $1, &checked)" ($bstring->string text))
                    (container-value-set! checked (pragma::bool "checked"))
                    NULL)))))

(defbuiltin (guicombobox bounds text (ref . active))
    (%with-c-bounds 'GuiComboBox
        (unless (string? text)
            (set! text (mkstrw 'GuiComboBox 2 text)))
        (when text
            (let ((active-idx (container-value active)))
                (unless (elong? active-idx)
                    (set! active-idx (mkelongw 'GuiComboBox 3 active-idx)))
                (when active-idx
                    (pragma "int active")
                    (pragma "active = (int)$1" ($belong->elong active-idx))
                    (pragma "GuiComboBox(bounds, $1, &active)" ($bstring->string text))
                    (container-value-set! active (pragma::elong "active"))
                    NULL)))))

; return #t when clicked
(defbuiltin (guidropdownbox bounds text (ref . active) editMode)
    (%with-c-bounds 'GuiDropdownBox
        (unless (string? text)
            (set! text (mkstrw 'GuiDropdownBox 2 text)))
        (when text
            (let ((active-idx (container-value active)))
                (unless (elong? active-idx)
                    (set! active-idx (mkboolw 'GuiDropdownBox 3 active-idx)))
                (when active-idx
                    (unless (boolean? editMode)
                        (set! editMode (mkboolw 'GuiDropdownBox 4 editMode)))
                    (when (boolean? editMode)
                        (pragma "int active")
                        (pragma "active = (int)$1" ($belong->elong active-idx))
                        (pragma "int result")
                        (pragma "result = GuiDropdownBox(bounds, $1, &active, $2 == BTRUE)"
                                ($bstring->string text)
                                editMode)
                        (container-value-set! active (pragma::elong "active"))
                        (pragma::bool "result")))))))

(defbuiltin (guispinner bounds text (ref . value) minValue maxValue editMode)
    (%with-c-bounds 'GuiSpinner
        (unless (string? text)
            (set! text (mkstrw 'GuiSpinner 2 text)))
        (when text
            (let ((value-val (container-value value)))
                (unless (elong? value-val)
                    (set! value-val (mkelongw 'GuiSpinner 3 value-val)))
                (when value-val
                    (unless (elong? minValue)
                        (set! minValue (mkelongw 'GuiSpinner 4 minValue)))
                    (when minValue
                        (unless (elong? maxValue)
                            (set! maxValue (mkelongw 'GuiSpinner 5 maxValue)))
                        (when maxValue
                            (unless (boolean? editMode)
                                (set! editMode (mkboolw 'GuiSpinner 6 editMode)))
                            (when (boolean? editMode)
                                (pragma "int value")
                                (pragma "value = (int)$1" ($belong->elong value-val))
                                (pragma "int result")
                                (pragma "result = GuiSpinner(bounds, $1, &value, (int)$2, (int)$3, $4 == BTRUE)"
                                        ($bstring->string text)
                                        ($belong->elong minValue)
                                        ($belong->elong maxValue)
                                        editMode)
                                (container-value-set! value (pragma::elong "value"))
                                (pragma::elong "result")))))))))

; return #t
(defbuiltin (guivaluebox bounds text (ref . value) minValue maxValue editMode)
    (%with-c-bounds 'GuiValueBox
        (unless (string? text)
            (set! text (mkstrw 'GuiValueBox 2 text)))
        (when text
            (let ((value-val (container-value value)))
                (unless (elong? value-val)
                    (set! value-val (mkelongw 'GuiValueBox 3 value-val)))
                (when value-val
                    (unless (elong? minValue)
                        (set! minValue (mkelongw 'GuiValueBox 4 minValue)))
                    (when minValue
                        (unless (elong? maxValue)
                            (set! maxValue (mkelongw 'GuiValueBox 5 maxValue)))
                        (when maxValue
                            (unless (boolean? editMode)
                                (set! editMode (mkboolw 'GuiValueBox 6 editMode)))
                            (when (boolean? editMode)
                                (pragma "int value")
                                (pragma "value = (int)$1" ($belong->elong value-val))
                                (pragma "int result")
                                (pragma "result = GuiValueBox(bounds, $1, &value, (int)$2, (int)$3, $4 == BTRUE)"
                                        ($bstring->string text)
                                        ($belong->elong minValue)
                                        ($belong->elong maxValue)
                                        editMode)
                                (container-value-set! value (pragma::elong "value"))
                                (pragma::elong "result")))))))))

; return #t on ENTER pressed
; textBuf: pre-allocated buf string, str_repeat/str_pad
; filledLen: real text length in textBuf
(defbuiltin (guitextbox bounds (ref . textBuf) (ref . filledLen) editMode)
    (%with-c-bounds 'GuiTextBox
        (let ((text (container-value textBuf)))
            (when (string? text)
                (unless (boolean? editMode)
                    (set! editMode (mkboolw 'GuiTextBox 4 editMode)))
                (when (boolean? editMode)
                    (pragma "int result")
                    (pragma "result = GuiTextBox(bounds, BSTRING_TO_STRING($1), STRING_LENGTH($1), $2 == BTRUE)"
                            text
                            editMode)
                    (container-value-set! filledLen (pragma::elong "strlen(BSTRING_TO_STRING($1))" text))
                    (pragma::bool "result"))))))

(defbuiltin (guislider bounds textLeft textRight (ref . value) minValue maxValue)
    (%with-c-bounds 'GuiSlider
        (unless (string? textLeft)
            (set! textLeft (mkstrw 'GuiSlider 2 textLeft)))
        (when textLeft
            (unless (string? textRight)
                (set! textRight (mkstrw 'GuiSlider 3 textRight)))
            (when textRight
                (let ((value-val (container-value value)))
                    (unless (flonum? value-val)
                        (set! value-val (mkflonumw 'GuiSlider 4 value-val)))
                    (when value-val
                        (unless (flonum? minValue)
                            (set! minValue (mkflonumw 'GuiSlider 5 minValue)))
                        (when minValue
                            (unless (flonum? maxValue)
                                (set! maxValue (mkflonumw 'GuiSlider 6 maxValue)))
                            (when maxValue
                                (pragma "float value")
                                (pragma "value = (float)$1" ($real->double value-val))
                                (pragma "GuiSlider(bounds, $1, $2, &value, (float)$3, (float)$4)"
                                        ($bstring->string textLeft)
                                        ($bstring->string textRight)
                                        ($real->double minValue)
                                        ($real->double maxValue))
                                (container-value-set! value (pragma::double "value"))
                                NULL))))))))

(defbuiltin (guisliderbar bounds textLeft textRight (ref . value) minValue maxValue)
    (%with-c-bounds 'GuiSliderBar
        (unless (string? textLeft)
            (set! textLeft (mkstrw 'GuiSliderBar 2 textLeft)))
        (when textLeft
            (unless (string? textRight)
                (set! textRight (mkstrw 'GuiSliderBar 3 textRight)))
            (when textRight
                (let ((value-val (container-value value)))
                    (unless (flonum? value-val)
                        (set! value-val (mkflonumw 'GuiSliderBar 4 value-val)))
                    (when value-val
                        (unless (flonum? minValue)
                            (set! minValue (mkflonumw 'GuiSliderBar 5 minValue)))
                        (when minValue
                            (unless (flonum? maxValue)
                                (set! maxValue (mkflonumw 'GuiSliderBar 6 maxValue)))
                            (when maxValue
                                (pragma "float value")
                                (pragma "value = (float)$1" ($real->double value-val))
                                (pragma "GuiSliderBar(bounds, $1, $2, &value, (float)$3, (float)$4)"
                                        ($bstring->string textLeft)
                                        ($bstring->string textRight)
                                        ($real->double minValue)
                                        ($real->double maxValue))
                                (container-value-set! value (pragma::double "value"))
                                NULL))))))))

(defbuiltin (guiprogressbar bounds textLeft textRight (ref . value) minValue maxValue)
    (%with-c-bounds 'GuiProgressBar
        (unless (string? textLeft)
            (set! textLeft (mkstrw 'GuiProgressBar 2 textLeft)))
        (when textLeft
            (unless (string? textRight)
                (set! textRight (mkstrw 'GuiProgressBar 3 textRight)))
            (when textRight
                (let ((value-val (container-value value)))
                    (unless (flonum? value-val)
                        (set! value-val (mkflonumw 'GuiProgressBar 4 value-val)))
                    (when value-val
                        (unless (flonum? minValue)
                            (set! minValue (mkflonumw 'GuiProgressBar 5 minValue)))
                        (when minValue
                            (unless (flonum? maxValue)
                                (set! maxValue (mkflonumw 'GuiProgressBar 6 maxValue)))
                            (when maxValue
                                (pragma "float value")
                                (pragma "value = (float)$1" ($real->double value-val))
                                (pragma "GuiProgressBar(bounds, $1, $2, &value, (float)$3, (float)$4)"
                                        ($bstring->string textLeft)
                                        ($bstring->string textRight)
                                        ($real->double minValue)
                                        ($real->double maxValue))
                                (container-value-set! value (pragma::double "value"))
                                NULL))))))))

(defbuiltin (guistatusbar bounds text)
    (%with-c-bounds 'GuiStatusBar
        (unless (string? text)
            (set! text (mkstrw 'GuiStatusBar 2 text)))
        (when text
            (pragma "GuiStatusBar(bounds, $1)" ($bstring->string text))
            NULL)))

(defbuiltin (guidummyrec bounds text)
    (%with-c-bounds 'GuiDummyRec
        (unless (string? text)
            (set! text (mkstrw 'GuiDummyRec 2 text)))
        (when text
            (pragma "GuiDummyRec(bounds, $1)" ($bstring->string text))
            NULL)))

(defbuiltin (guigrid bounds spacing subdivs ((ref . mouseCell) unpassed))
    (%with-c-bounds 'GuiGrid
        (unless (flonum? spacing)
            (set! spacing (mkflonumw 'GuiGrid 2 spacing)))
        (when spacing
            (unless (elong? subdivs)
                (set! subdivs (mkelongw 'GuiGrid 3 subdivs)))
            (when subdivs
                (if (eq? mouseCell unpassed)
                    (pragma "GuiGrid(bounds, NULL, (float)$1, (int)$2, NULL)"
                            ($real->double spacing)
                            ($belong->elong subdivs))
                    (begin
                        (pragma "Vector2 mouseCell")
                        (pragma "GuiGrid(bounds, NULL, (float)$1, (int)$2, &mouseCell)"
                                ($real->double spacing)
                                ($belong->elong subdivs))
                        (container-value-set! mouseCell (%mkvector2-v "mouseCell"))))
                NULL))))

; Advance controls set

(defbuiltin (guilistview bounds text (ref . scrollIndex) (ref . active))
    (%with-c-bounds 'GuiListView
        (unless (or (null? text)
                    (string? text))
            (set! text (mkstrw 'GuiListView 2 text)))
        (when text
            (let ((scrollIndex-val (container-value scrollIndex)))
                (unless (elong? scrollIndex-val)
                    (set! scrollIndex-val (mkelongw 'GuiListView 3 scrollIndex-val)))
                (when scrollIndex-val
                    (let ((active-idx (container-value active)))
                        (unless (elong? active-idx)
                            (set! active-idx (mkelongw 'GuiListView 4 active-idx)))
                        (when active-idx
                            (pragma "int scrollIndex, active")
                            (pragma "scrollIndex = (int)$1;
                                     active = (int)$2"
                                    ($belong->elong scrollIndex-val)
                                    ($belong->elong active-idx))
                            (pragma "GuiListView(bounds, NULLP($1) ? NULL : BSTRING_TO_STRING($1), &scrollIndex, &active)"
                                    text)
                            (container-value-set! scrollIndex (pragma::elong "scrollIndex"))
                            (container-value-set! active (pragma::elong "active"))
                            NULL)))))))

(defbuiltin (guilistviewex bounds items (ref . scrollIndex) (ref . active) (ref . focus))
    (%with-c-bounds 'GuiListViewEx
        (%with-c-text-list 'GuiListViewEx 2 items
            (let ((scrollIndex-val (container-value scrollIndex)))
                (unless (elong? scrollIndex-val)
                    (set! scrollIndex-val (mkelongw 'GuiListViewEx 3 scrollIndex-val)))
                (when scrollIndex-val
                    (let ((active-idx (container-value active)))
                        (unless (elong? active-idx)
                            (set! active-idx (mkelongw 'GuiListViewEx 4 active-idx)))
                        (when active-idx
                            (let ((focus-val (container-value focus)))
                                (unless (elong? focus-val)
                                    (set! focus-val (mkelongw 'GuiListViewEx 5 focus-val)))
                                (when focus-val
                                    (pragma "int scrollIndex, active, focus")
                                    (pragma "scrollIndex = (int)$1;
                                             active = (int)$2;
                                             focus = (int)$3"
                                            ($belong->elong scrollIndex-val)
                                            ($belong->elong active-idx)
                                            ($belong->elong focus-val))
                                    (pragma "GuiListViewEx(bounds, text, count, &scrollIndex, &active, &focus)")
                                    (container-value-set! scrollIndex (pragma::elong "scrollIndex"))
                                    (container-value-set! active (pragma::elong "active"))
                                    (container-value-set! focus (pragma::elong "focus"))
                                    NULL)))))))))

(defbuiltin (guimessagebox bounds title message buttons)
    (%with-c-bounds 'GuiMessageBox
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

; return pressed button index
(defbuiltin (guitextinputbox bounds title message buttons (ref . textBuf) (ref . filledLen) ((ref . secretViewActive) unpassed))
    (%with-c-bounds 'GuiTextInputBox
        (unless (string? title)
            (set! title (mkstrw 'GuiTextInputBox 2 title)))
        (when title
            (unless (string? message)
                (set! message (mkstrw 'GuiTextInputBox 3 message)))
            (when message
                (unless (string? buttons)
                    (set! buttons (mkstrw 'GuiTextInputBox 4 buttons)))
                (when buttons
                    (let ((text (container-value textBuf)))
                        (when (string? text)
                             (if (eq? secretViewActive unpassed)
                                 (begin
                                    (pragma "int result")
                                    (pragma "result = GuiTextInputBox(bounds, $1, $2, $3, BSTRING_TO_STRING($4), STRING_LENGTH($4), NULL)"
                                            ($bstring->string title)
                                            ($bstring->string message)
                                            ($bstring->string buttons)
                                            text)
                                    (container-value-set! filledLen (pragma::elong "strlen(BSTRING_TO_STRING($1))" text))
                                    (pragma::elong "result"))
                                 (let ((secretViewActive-val (container-value secretViewActive)))
                                    (unless (boolean? secretViewActive-val)
                                        (set! secretViewActive-val (mkboolw 'GuiTextInputBox 7 secretViewActive-val)))
                                    (when (boolean? secretViewActive-val)
                                        (pragma "bool secretViewActive")
                                        (pragma "secretViewActive = $1 == BTRUE" secretViewActive-val)
                                        (pragma "int result")
                                        (pragma "result = GuiTextInputBox(bounds, $1, $2, $3, BSTRING_TO_STRING($4), STRING_LENGTH($4), &secretViewActive)"
                                                ($bstring->string title)
                                                ($bstring->string message)
                                                ($bstring->string buttons)
                                                text)
                                        (container-value-set! filledLen (pragma::elong "strlen(BSTRING_TO_STRING($1))" text))
                                        (container-value-set! secretViewActive (pragma::bool "secretViewActive"))
                                        (pragma::elong "result")))))))))))

(defbuiltin (guicolorpicker bounds text (ref . color))
    (%with-c-bounds 'GuiColorPicker
        (unless (string? text)
            (set! text (mkstrw 'GuiColorPicker 2 text)))
        (when text
            (let ((color-val (container-value color)))
                (pragma "Color c")
                (when (or (null? color-val)
                          (%init-c-color 'GuiColorPicker 3 color-val "c"))
                    (pragma "GuiColorPicker(bounds, $1, &c)" ($bstring->string text))
                    (container-value-set! color (%mkcolor-c "c"))
                    NULL)))))

(defbuiltin (guicolorpanel bounds text (ref . color))
    (%with-c-bounds 'GuiColorPanel
        (unless (string? text)
            (set! text (mkstrw 'GuiColorPanel 2 text)))
        (when text
            (let ((color-val (container-value color)))
                (pragma "Color c")
                (when (or (null? color-val)
                          (%init-c-color 'GuiColorPanel 3 color-val "c"))
                    (pragma "GuiColorPanel(bounds, $1, &c)" ($bstring->string text))
                    (container-value-set! color (%mkcolor-c "c"))
                    NULL)))))

(defbuiltin (guicolorbaralpha bounds text (ref . alpha))
    (%with-c-bounds 'GuiColorBarAlpha
        (unless (string? text)
            (set! text (mkstrw 'GuiColorBarAlpha 2 text)))
        (when text
            (let ((alpha-val (container-value alpha)))
                (unless (flonum? alpha-val)
                    (set! alpha-val (mkflonumw 'GuiColorBarAlpha 3 alpha-val)))
                (when alpha-val
                    (pragma "float alpha")
                    (pragma "alpha = (float)$1" ($real->double alpha-val))
                    (pragma "GuiColorBarAlpha(bounds, $1, &alpha)" ($bstring->string text))
                    (container-value-set! alpha (pragma::double "alpha"))
                    NULL)))))

(defbuiltin (guicolorbarhue bounds text (ref . value))
    (%with-c-bounds 'GuiColorBarHue
        (unless (string? text)
            (set! text (mkstrw 'GuiColorBarHue 2 text)))
        (when text
            (let ((value-val (container-value value)))
                (unless (flonum? value-val)
                    (set! value-val (mkflonumw 'GuiColorBarHue 3 value-val)))
                (when value-val
                    (pragma "float value")
                    (pragma "value = (float)$1" ($real->double value-val))
                    (pragma "GuiColorBarHue(bounds, $1, &value)" ($bstring->string text))
                    (container-value-set! value (pragma::double "value"))
                    NULL)))))

(defbuiltin (guicolorpickerhsv bounds text (ref . colorHsv))
    (%with-c-bounds 'GuiColorPickerHSV
        (unless (string? text)
            (set! text (mkstrw 'GuiColorPickerHSV 2 text)))
        (when text
            (let ((colorHsv-val (container-value colorHsv)))
                (pragma "Vector3 v3")
                (when (or (null? colorHsv-val)
                          (%init-c-vector3 'GuiColorPickerHSV 3 colorHsv-val "v3"))
                    (pragma "GuiColorPickerHSV(bounds, $1, &v3)" ($bstring->string text))
                    (container-value-set! colorHsv (%mkvector3-v "v3"))
                    NULL)))))

(defbuiltin (guicolorpanelhsv bounds text (ref . colorHsv))
    (%with-c-bounds 'GuiColorPanelHSV
        (unless (string? text)
            (set! text (mkstrw 'GuiColorPanelHSV 2 text)))
        (when text
            (let ((colorHsv-val (container-value colorHsv)))
                (pragma "Vector3 v3")
                (when (or (null? colorHsv-val)
                          (%init-c-vector3 'GuiColorPanelHSV 3 colorHsv-val "v3"))
                    (pragma "GuiColorPanelHSV(bounds, $1, &v3)" ($bstring->string text))
                    (container-value-set! colorHsv (%mkvector3-v "v3"))
                    NULL)))))
