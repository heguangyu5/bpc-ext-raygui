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
        ; enum GuiState
        STATE_NORMAL
        STATE_FOCUSED
        STATE_PRESSED
        STATE_DISABLED
        ; enum GuiTextAlignment
        TEXT_ALIGN_LEFT
        TEXT_ALIGN_CENTER
        TEXT_ALIGN_RIGHT
        ; enum GuiTextAlignmentVertical
        TEXT_ALIGN_TOP
        TEXT_ALIGN_MIDDLE
        TEXT_ALIGN_BOTTOM
        ; enum GuiTextWrapMode
        TEXT_WRAP_NONE
        TEXT_WRAP_CHAR
        TEXT_WRAP_WORD
        ; enum GuiControl
        GUI_CONTROL_DEFAULT
        LABEL
        BUTTON
        TOGGLE
        SLIDER
        PROGRESSBAR
        CHECKBOX
        COMBOBOX
        DROPDOWNBOX
        TEXTBOX
        VALUEBOX
        SPINNER
        LISTVIEW
        COLORPICKER
        SCROLLBAR
        STATUSBAR
        ; enum GuiControlProperty
        BORDER_COLOR_NORMAL
        BASE_COLOR_NORMAL
        TEXT_COLOR_NORMAL
        BORDER_COLOR_FOCUSED
        BASE_COLOR_FOCUSED
        TEXT_COLOR_FOCUSED
        BORDER_COLOR_PRESSED
        BASE_COLOR_PRESSED
        TEXT_COLOR_PRESSED
        BORDER_COLOR_DISABLED
        BASE_COLOR_DISABLED
        TEXT_COLOR_DISABLED
        BORDER_WIDTH
        TEXT_PADDING
        TEXT_ALIGNMENT
        ; enum GuiDefaultProperty
        TEXT_SIZE
        TEXT_SPACING
        LINE_COLOR
        BACKGROUND_COLOR
        TEXT_LINE_SPACING
        TEXT_ALIGNMENT_VERTICAL
        TEXT_WRAP_MODE
        ; enum GuiToggleProperty
        GROUP_PADDING
        ; enum GuiSliderProperty
        SLIDER_WIDTH
        SLIDER_PADDING
        ; enum GuiProgressBarProperty
        PROGRESS_PADDING
        ; enum GuiScrollBarProperty
        ARROWS_SIZE
        ARROWS_VISIBLE
        SCROLL_SLIDER_PADDING
        SCROLL_SLIDER_SIZE
        SCROLL_PADDING
        SCROLL_SPEED
        ; enum GuiCheckBoxProperty
        CHECK_PADDING
        ; enum GuiComboBoxProperty
        COMBO_BUTTON_WIDTH
        COMBO_BUTTON_SPACING
        ; enum GuiDropdownBoxProperty
        ARROW_PADDING
        DROPDOWN_ITEMS_SPACING
        ; enum GuiTextBoxProperty
        TEXT_READONLY
        ; enum GuiSpinnerProperty
        SPIN_BUTTON_WIDTH
        SPIN_BUTTON_SPACING
        ; enum GuiListViewProperty
        LIST_ITEMS_HEIGHT
        LIST_ITEMS_SPACING
        SCROLLBAR_WIDTH
        SCROLLBAR_SIDE
        ; enum GuiColorPickerProperty
        COLOR_SELECTOR_SIZE
        HUEBAR_WIDTH
        HUEBAR_PADDING
        HUEBAR_SELECTOR_HEIGHT
        HUEBAR_SELECTOR_OVERFLOW
        ; enum GuiIconName
        ICON_NONE
        ICON_FOLDER_FILE_OPEN
        ICON_FILE_SAVE_CLASSIC
        ICON_FOLDER_OPEN
        ICON_FOLDER_SAVE
        ICON_FILE_OPEN
        ICON_FILE_SAVE
        ICON_FILE_EXPORT
        ICON_FILE_ADD
        ICON_FILE_DELETE
        ICON_FILETYPE_TEXT
        ICON_FILETYPE_AUDIO
        ICON_FILETYPE_IMAGE
        ICON_FILETYPE_PLAY
        ICON_FILETYPE_VIDEO
        ICON_FILETYPE_INFO
        ICON_FILE_COPY
        ICON_FILE_CUT
        ICON_FILE_PASTE
        ICON_CURSOR_HAND
        ICON_CURSOR_POINTER
        ICON_CURSOR_CLASSIC
        ICON_PENCIL
        ICON_PENCIL_BIG
        ICON_BRUSH_CLASSIC
        ICON_BRUSH_PAINTER
        ICON_WATER_DROP
        ICON_COLOR_PICKER
        ICON_RUBBER
        ICON_COLOR_BUCKET
        ICON_TEXT_T
        ICON_TEXT_A
        ICON_SCALE
        ICON_RESIZE
        ICON_FILTER_POINT
        ICON_FILTER_BILINEAR
        ICON_CROP
        ICON_CROP_ALPHA
        ICON_SQUARE_TOGGLE
        ICON_SYMMETRY
        ICON_SYMMETRY_HORIZONTAL
        ICON_SYMMETRY_VERTICAL
        ICON_LENS
        ICON_LENS_BIG
        ICON_EYE_ON
        ICON_EYE_OFF
        ICON_FILTER_TOP
        ICON_FILTER
        ICON_TARGET_POINT
        ICON_TARGET_SMALL
        ICON_TARGET_BIG
        ICON_TARGET_MOVE
        ICON_CURSOR_MOVE
        ICON_CURSOR_SCALE
        ICON_CURSOR_SCALE_RIGHT
        ICON_CURSOR_SCALE_LEFT
        ICON_UNDO
        ICON_REDO
        ICON_REREDO
        ICON_MUTATE
        ICON_ROTATE
        ICON_REPEAT
        ICON_SHUFFLE
        ICON_EMPTYBOX
        ICON_TARGET
        ICON_TARGET_SMALL_FILL
        ICON_TARGET_BIG_FILL
        ICON_TARGET_MOVE_FILL
        ICON_CURSOR_MOVE_FILL
        ICON_CURSOR_SCALE_FILL
        ICON_CURSOR_SCALE_RIGHT_FILL
        ICON_CURSOR_SCALE_LEFT_FILL
        ICON_UNDO_FILL
        ICON_REDO_FILL
        ICON_REREDO_FILL
        ICON_MUTATE_FILL
        ICON_ROTATE_FILL
        ICON_REPEAT_FILL
        ICON_SHUFFLE_FILL
        ICON_EMPTYBOX_SMALL
        ICON_BOX
        ICON_BOX_TOP
        ICON_BOX_TOP_RIGHT
        ICON_BOX_RIGHT
        ICON_BOX_BOTTOM_RIGHT
        ICON_BOX_BOTTOM
        ICON_BOX_BOTTOM_LEFT
        ICON_BOX_LEFT
        ICON_BOX_TOP_LEFT
        ICON_BOX_CENTER
        ICON_BOX_CIRCLE_MASK
        ICON_POT
        ICON_ALPHA_MULTIPLY
        ICON_ALPHA_CLEAR
        ICON_DITHERING
        ICON_MIPMAPS
        ICON_BOX_GRID
        ICON_GRID
        ICON_BOX_CORNERS_SMALL
        ICON_BOX_CORNERS_BIG
        ICON_FOUR_BOXES
        ICON_GRID_FILL
        ICON_BOX_MULTISIZE
        ICON_ZOOM_SMALL
        ICON_ZOOM_MEDIUM
        ICON_ZOOM_BIG
        ICON_ZOOM_ALL
        ICON_ZOOM_CENTER
        ICON_BOX_DOTS_SMALL
        ICON_BOX_DOTS_BIG
        ICON_BOX_CONCENTRIC
        ICON_BOX_GRID_BIG
        ICON_OK_TICK
        ICON_CROSS
        ICON_ARROW_LEFT
        ICON_ARROW_RIGHT
        ICON_ARROW_DOWN
        ICON_ARROW_UP
        ICON_ARROW_LEFT_FILL
        ICON_ARROW_RIGHT_FILL
        ICON_ARROW_DOWN_FILL
        ICON_ARROW_UP_FILL
        ICON_AUDIO
        ICON_FX
        ICON_WAVE
        ICON_WAVE_SINUS
        ICON_WAVE_SQUARE
        ICON_WAVE_TRIANGULAR
        ICON_CROSS_SMALL
        ICON_PLAYER_PREVIOUS
        ICON_PLAYER_PLAY_BACK
        ICON_PLAYER_PLAY
        ICON_PLAYER_PAUSE
        ICON_PLAYER_STOP
        ICON_PLAYER_NEXT
        ICON_PLAYER_RECORD
        ICON_MAGNET
        ICON_LOCK_CLOSE
        ICON_LOCK_OPEN
        ICON_CLOCK
        ICON_TOOLS
        ICON_GEAR
        ICON_GEAR_BIG
        ICON_BIN
        ICON_HAND_POINTER
        ICON_LASER
        ICON_COIN
        ICON_EXPLOSION
        ICON_1UP
        ICON_PLAYER
        ICON_PLAYER_JUMP
        ICON_KEY
        ICON_DEMON
        ICON_TEXT_POPUP
        ICON_GEAR_EX
        ICON_CRACK
        ICON_CRACK_POINTS
        ICON_STAR
        ICON_DOOR
        ICON_EXIT
        ICON_MODE_2D
        ICON_MODE_3D
        ICON_CUBE
        ICON_CUBE_FACE_TOP
        ICON_CUBE_FACE_LEFT
        ICON_CUBE_FACE_FRONT
        ICON_CUBE_FACE_BOTTOM
        ICON_CUBE_FACE_RIGHT
        ICON_CUBE_FACE_BACK
        ICON_CAMERA
        ICON_SPECIAL
        ICON_LINK_NET
        ICON_LINK_BOXES
        ICON_LINK_MULTI
        ICON_LINK
        ICON_LINK_BROKE
        ICON_TEXT_NOTES
        ICON_NOTEBOOK
        ICON_SUITCASE
        ICON_SUITCASE_ZIP
        ICON_MAILBOX
        ICON_MONITOR
        ICON_PRINTER
        ICON_PHOTO_CAMERA
        ICON_PHOTO_CAMERA_FLASH
        ICON_HOUSE
        ICON_HEART
        ICON_CORNER
        ICON_VERTICAL_BARS
        ICON_VERTICAL_BARS_FILL
        ICON_LIFE_BARS
        ICON_INFO
        ICON_CROSSLINE
        ICON_HELP
        ICON_FILETYPE_ALPHA
        ICON_FILETYPE_HOME
        ICON_LAYERS_VISIBLE
        ICON_LAYERS
        ICON_WINDOW
        ICON_HIDPI
        ICON_FILETYPE_BINARY
        ICON_HEX
        ICON_SHIELD
        ICON_FILE_NEW
        ICON_FOLDER_ADD
        ICON_ALARM
        ICON_CPU
        ICON_ROM
        ICON_STEP_OVER
        ICON_STEP_INTO
        ICON_STEP_OUT
        ICON_RESTART
        ICON_BREAKPOINT_ON
        ICON_BREAKPOINT_OFF
        ICON_BURGER_MENU
        ICON_CASE_SENSITIVE
        ICON_REG_EXP
        ICON_FOLDER
        ICON_FILE
        ICON_SAND_TIMER
        ICON_220
        ICON_221
        ICON_222
        ICON_223
        ICON_224
        ICON_225
        ICON_226
        ICON_227
        ICON_228
        ICON_229
        ICON_230
        ICON_231
        ICON_232
        ICON_233
        ICON_234
        ICON_235
        ICON_236
        ICON_237
        ICON_238
        ICON_239
        ICON_240
        ICON_241
        ICON_242
        ICON_243
        ICON_244
        ICON_245
        ICON_246
        ICON_247
        ICON_248
        ICON_249
        ICON_250
        ICON_251
        ICON_252
        ICON_253
        ICON_254
        ICON_255
        ; Global gui state control functions
        (guienable)
        (guidisable)
        (guilock)
        (guiunlock)
        (guiislocked)
        (guisetalpha alpha)
        (guisetstate state)
        (guigetstate)
        ; Style set/get functions
        (guisetstyle control property value)
        (guigetstyle control property)
        ; Styles loading functions
        (guiloadstyle fileName)
        (guiloadstyledefault)
        ; Icons functionality
        (guiicontext iconId text)
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

; enum GuiState

(defconstant STATE_NORMAL   (pragma::elong "STATE_NORMAL"))
(defconstant STATE_FOCUSED  (pragma::elong "STATE_FOCUSED"))
(defconstant STATE_PRESSED  (pragma::elong "STATE_PRESSED"))
(defconstant STATE_DISABLED (pragma::elong "STATE_DISABLED"))

; enum GuiTextAlignment

(defconstant TEXT_ALIGN_LEFT    (pragma::elong "TEXT_ALIGN_LEFT"))
(defconstant TEXT_ALIGN_CENTER  (pragma::elong "TEXT_ALIGN_CENTER"))
(defconstant TEXT_ALIGN_RIGHT   (pragma::elong "TEXT_ALIGN_RIGHT"))

; enum GuiTextAlignmentVertical

(defconstant TEXT_ALIGN_TOP     (pragma::elong "TEXT_ALIGN_TOP"))
(defconstant TEXT_ALIGN_MIDDLE  (pragma::elong "TEXT_ALIGN_MIDDLE"))
(defconstant TEXT_ALIGN_BOTTOM  (pragma::elong "TEXT_ALIGN_BOTTOM"))

; enum GuiTextWrapMode

(defconstant TEXT_WRAP_NONE (pragma::elong "TEXT_WRAP_NONE"))
(defconstant TEXT_WRAP_CHAR (pragma::elong "TEXT_WRAP_CHAR"))
(defconstant TEXT_WRAP_WORD (pragma::elong "TEXT_WRAP_WORD"))

; enum GuiControl

(defconstant GUI_CONTROL_DEFAULT (pragma::elong "DEFAULT"))
(defconstant LABEL               (pragma::elong "LABEL"))
(defconstant BUTTON              (pragma::elong "BUTTON"))
(defconstant TOGGLE              (pragma::elong "TOGGLE"))
(defconstant SLIDER              (pragma::elong "SLIDER"))
(defconstant PROGRESSBAR         (pragma::elong "PROGRESSBAR"))
(defconstant CHECKBOX            (pragma::elong "CHECKBOX"))
(defconstant COMBOBOX            (pragma::elong "COMBOBOX"))
(defconstant DROPDOWNBOX         (pragma::elong "DROPDOWNBOX"))
(defconstant TEXTBOX             (pragma::elong "TEXTBOX"))
(defconstant VALUEBOX            (pragma::elong "VALUEBOX"))
(defconstant SPINNER             (pragma::elong "SPINNER"))
(defconstant LISTVIEW            (pragma::elong "LISTVIEW"))
(defconstant COLORPICKER         (pragma::elong "COLORPICKER"))
(defconstant SCROLLBAR           (pragma::elong "SCROLLBAR"))
(defconstant STATUSBAR           (pragma::elong "STATUSBAR"))

; enum GuiControlProperty

(defconstant BORDER_COLOR_NORMAL   (pragma::elong "BORDER_COLOR_NORMAL"))
(defconstant BASE_COLOR_NORMAL     (pragma::elong "BASE_COLOR_NORMAL"))
(defconstant TEXT_COLOR_NORMAL     (pragma::elong "TEXT_COLOR_NORMAL"))
(defconstant BORDER_COLOR_FOCUSED  (pragma::elong "BORDER_COLOR_FOCUSED"))
(defconstant BASE_COLOR_FOCUSED    (pragma::elong "BASE_COLOR_FOCUSED"))
(defconstant TEXT_COLOR_FOCUSED    (pragma::elong "TEXT_COLOR_FOCUSED"))
(defconstant BORDER_COLOR_PRESSED  (pragma::elong "BORDER_COLOR_PRESSED"))
(defconstant BASE_COLOR_PRESSED    (pragma::elong "BASE_COLOR_PRESSED"))
(defconstant TEXT_COLOR_PRESSED    (pragma::elong "TEXT_COLOR_PRESSED"))
(defconstant BORDER_COLOR_DISABLED (pragma::elong "BORDER_COLOR_DISABLED"))
(defconstant BASE_COLOR_DISABLED   (pragma::elong "BASE_COLOR_DISABLED"))
(defconstant TEXT_COLOR_DISABLED   (pragma::elong "TEXT_COLOR_DISABLED"))
(defconstant BORDER_WIDTH          (pragma::elong "BORDER_WIDTH"))
(defconstant TEXT_PADDING          (pragma::elong "TEXT_PADDING"))
(defconstant TEXT_ALIGNMENT        (pragma::elong "TEXT_ALIGNMENT"))

; enum GuiDefaultProperty

(defconstant TEXT_SIZE                  (pragma::elong "TEXT_SIZE"))
(defconstant TEXT_SPACING               (pragma::elong "TEXT_SPACING"))
(defconstant LINE_COLOR                 (pragma::elong "LINE_COLOR"))
(defconstant BACKGROUND_COLOR           (pragma::elong "BACKGROUND_COLOR"))
(defconstant TEXT_LINE_SPACING          (pragma::elong "TEXT_LINE_SPACING"))
(defconstant TEXT_ALIGNMENT_VERTICAL    (pragma::elong "TEXT_ALIGNMENT_VERTICAL"))
(defconstant TEXT_WRAP_MODE             (pragma::elong "TEXT_WRAP_MODE"))


; enum GuiToggleProperty

(defconstant GROUP_PADDING (pragma::elong "GROUP_PADDING"))

; enum GuiSliderProperty

(defconstant SLIDER_WIDTH   (pragma::elong "SLIDER_WIDTH"))
(defconstant SLIDER_PADDING (pragma::elong "SLIDER_PADDING"))

; enum GuiProgressBarProperty

(defconstant PROGRESS_PADDING (pragma::elong "PROGRESS_PADDING"))

; enum GuiScrollBarProperty

(defconstant ARROWS_SIZE           (pragma::elong "ARROWS_SIZE"))
(defconstant ARROWS_VISIBLE        (pragma::elong "ARROWS_VISIBLE"))
(defconstant SCROLL_SLIDER_PADDING (pragma::elong "SCROLL_SLIDER_PADDING"))
(defconstant SCROLL_SLIDER_SIZE    (pragma::elong "SCROLL_SLIDER_SIZE"))
(defconstant SCROLL_PADDING        (pragma::elong "SCROLL_PADDING"))
(defconstant SCROLL_SPEED          (pragma::elong "SCROLL_SPEED"))

; enum GuiCheckBoxProperty

(defconstant CHECK_PADDING (pragma::elong "CHECK_PADDING"))

; enum GuiComboBoxProperty

(defconstant COMBO_BUTTON_WIDTH     (pragma::elong "COMBO_BUTTON_WIDTH"))
(defconstant COMBO_BUTTON_SPACING   (pragma::elong "COMBO_BUTTON_SPACING"))

; enum GuiDropdownBoxProperty

(defconstant ARROW_PADDING          (pragma::elong "ARROW_PADDING"))
(defconstant DROPDOWN_ITEMS_SPACING (pragma::elong "DROPDOWN_ITEMS_SPACING"))

; enum GuiTextBoxProperty

(defconstant TEXT_READONLY (pragma::elong "TEXT_READONLY"))

; enum GuiSpinnerProperty

(defconstant SPIN_BUTTON_WIDTH   (pragma::elong "SPIN_BUTTON_WIDTH"))
(defconstant SPIN_BUTTON_SPACING (pragma::elong "SPIN_BUTTON_SPACING"))

; enum GuiListViewProperty

(defconstant LIST_ITEMS_HEIGHT  (pragma::elong "LIST_ITEMS_HEIGHT"))
(defconstant LIST_ITEMS_SPACING (pragma::elong "LIST_ITEMS_SPACING"))
(defconstant SCROLLBAR_WIDTH    (pragma::elong "SCROLLBAR_WIDTH"))
(defconstant SCROLLBAR_SIDE     (pragma::elong "SCROLLBAR_SIDE"))

; enum GuiColorPickerProperty

(defconstant COLOR_SELECTOR_SIZE      (pragma::elong "COLOR_SELECTOR_SIZE"))
(defconstant HUEBAR_WIDTH             (pragma::elong "HUEBAR_WIDTH"))
(defconstant HUEBAR_PADDING           (pragma::elong "HUEBAR_PADDING"))
(defconstant HUEBAR_SELECTOR_HEIGHT   (pragma::elong "HUEBAR_SELECTOR_HEIGHT"))
(defconstant HUEBAR_SELECTOR_OVERFLOW (pragma::elong "HUEBAR_SELECTOR_OVERFLOW"))

; enum GuiIconName

(defconstant ICON_NONE                    (pragma::elong "ICON_NONE"))
(defconstant ICON_FOLDER_FILE_OPEN        (pragma::elong "ICON_FOLDER_FILE_OPEN"))
(defconstant ICON_FILE_SAVE_CLASSIC       (pragma::elong "ICON_FILE_SAVE_CLASSIC"))
(defconstant ICON_FOLDER_OPEN             (pragma::elong "ICON_FOLDER_OPEN"))
(defconstant ICON_FOLDER_SAVE             (pragma::elong "ICON_FOLDER_SAVE"))
(defconstant ICON_FILE_OPEN               (pragma::elong "ICON_FILE_OPEN"))
(defconstant ICON_FILE_SAVE               (pragma::elong "ICON_FILE_SAVE"))
(defconstant ICON_FILE_EXPORT             (pragma::elong "ICON_FILE_EXPORT"))
(defconstant ICON_FILE_ADD                (pragma::elong "ICON_FILE_ADD"))
(defconstant ICON_FILE_DELETE             (pragma::elong "ICON_FILE_DELETE"))
(defconstant ICON_FILETYPE_TEXT           (pragma::elong "ICON_FILETYPE_TEXT"))
(defconstant ICON_FILETYPE_AUDIO          (pragma::elong "ICON_FILETYPE_AUDIO"))
(defconstant ICON_FILETYPE_IMAGE          (pragma::elong "ICON_FILETYPE_IMAGE"))
(defconstant ICON_FILETYPE_PLAY           (pragma::elong "ICON_FILETYPE_PLAY"))
(defconstant ICON_FILETYPE_VIDEO          (pragma::elong "ICON_FILETYPE_VIDEO"))
(defconstant ICON_FILETYPE_INFO           (pragma::elong "ICON_FILETYPE_INFO"))
(defconstant ICON_FILE_COPY               (pragma::elong "ICON_FILE_COPY"))
(defconstant ICON_FILE_CUT                (pragma::elong "ICON_FILE_CUT"))
(defconstant ICON_FILE_PASTE              (pragma::elong "ICON_FILE_PASTE"))
(defconstant ICON_CURSOR_HAND             (pragma::elong "ICON_CURSOR_HAND"))
(defconstant ICON_CURSOR_POINTER          (pragma::elong "ICON_CURSOR_POINTER"))
(defconstant ICON_CURSOR_CLASSIC          (pragma::elong "ICON_CURSOR_CLASSIC"))
(defconstant ICON_PENCIL                  (pragma::elong "ICON_PENCIL"))
(defconstant ICON_PENCIL_BIG              (pragma::elong "ICON_PENCIL_BIG"))
(defconstant ICON_BRUSH_CLASSIC           (pragma::elong "ICON_BRUSH_CLASSIC"))
(defconstant ICON_BRUSH_PAINTER           (pragma::elong "ICON_BRUSH_PAINTER"))
(defconstant ICON_WATER_DROP              (pragma::elong "ICON_WATER_DROP"))
(defconstant ICON_COLOR_PICKER            (pragma::elong "ICON_COLOR_PICKER"))
(defconstant ICON_RUBBER                  (pragma::elong "ICON_RUBBER"))
(defconstant ICON_COLOR_BUCKET            (pragma::elong "ICON_COLOR_BUCKET"))
(defconstant ICON_TEXT_T                  (pragma::elong "ICON_TEXT_T"))
(defconstant ICON_TEXT_A                  (pragma::elong "ICON_TEXT_A"))
(defconstant ICON_SCALE                   (pragma::elong "ICON_SCALE"))
(defconstant ICON_RESIZE                  (pragma::elong "ICON_RESIZE"))
(defconstant ICON_FILTER_POINT            (pragma::elong "ICON_FILTER_POINT"))
(defconstant ICON_FILTER_BILINEAR         (pragma::elong "ICON_FILTER_BILINEAR"))
(defconstant ICON_CROP                    (pragma::elong "ICON_CROP"))
(defconstant ICON_CROP_ALPHA              (pragma::elong "ICON_CROP_ALPHA"))
(defconstant ICON_SQUARE_TOGGLE           (pragma::elong "ICON_SQUARE_TOGGLE"))
(defconstant ICON_SYMMETRY                (pragma::elong "ICON_SYMMETRY"))
(defconstant ICON_SYMMETRY_HORIZONTAL     (pragma::elong "ICON_SYMMETRY_HORIZONTAL"))
(defconstant ICON_SYMMETRY_VERTICAL       (pragma::elong "ICON_SYMMETRY_VERTICAL"))
(defconstant ICON_LENS                    (pragma::elong "ICON_LENS"))
(defconstant ICON_LENS_BIG                (pragma::elong "ICON_LENS_BIG"))
(defconstant ICON_EYE_ON                  (pragma::elong "ICON_EYE_ON"))
(defconstant ICON_EYE_OFF                 (pragma::elong "ICON_EYE_OFF"))
(defconstant ICON_FILTER_TOP              (pragma::elong "ICON_FILTER_TOP"))
(defconstant ICON_FILTER                  (pragma::elong "ICON_FILTER"))
(defconstant ICON_TARGET_POINT            (pragma::elong "ICON_TARGET_POINT"))
(defconstant ICON_TARGET_SMALL            (pragma::elong "ICON_TARGET_SMALL"))
(defconstant ICON_TARGET_BIG              (pragma::elong "ICON_TARGET_BIG"))
(defconstant ICON_TARGET_MOVE             (pragma::elong "ICON_TARGET_MOVE"))
(defconstant ICON_CURSOR_MOVE             (pragma::elong "ICON_CURSOR_MOVE"))
(defconstant ICON_CURSOR_SCALE            (pragma::elong "ICON_CURSOR_SCALE"))
(defconstant ICON_CURSOR_SCALE_RIGHT      (pragma::elong "ICON_CURSOR_SCALE_RIGHT"))
(defconstant ICON_CURSOR_SCALE_LEFT       (pragma::elong "ICON_CURSOR_SCALE_LEFT"))
(defconstant ICON_UNDO                    (pragma::elong "ICON_UNDO"))
(defconstant ICON_REDO                    (pragma::elong "ICON_REDO"))
(defconstant ICON_REREDO                  (pragma::elong "ICON_REREDO"))
(defconstant ICON_MUTATE                  (pragma::elong "ICON_MUTATE"))
(defconstant ICON_ROTATE                  (pragma::elong "ICON_ROTATE"))
(defconstant ICON_REPEAT                  (pragma::elong "ICON_REPEAT"))
(defconstant ICON_SHUFFLE                 (pragma::elong "ICON_SHUFFLE"))
(defconstant ICON_EMPTYBOX                (pragma::elong "ICON_EMPTYBOX"))
(defconstant ICON_TARGET                  (pragma::elong "ICON_TARGET"))
(defconstant ICON_TARGET_SMALL_FILL       (pragma::elong "ICON_TARGET_SMALL_FILL"))
(defconstant ICON_TARGET_BIG_FILL         (pragma::elong "ICON_TARGET_BIG_FILL"))
(defconstant ICON_TARGET_MOVE_FILL        (pragma::elong "ICON_TARGET_MOVE_FILL"))
(defconstant ICON_CURSOR_MOVE_FILL        (pragma::elong "ICON_CURSOR_MOVE_FILL"))
(defconstant ICON_CURSOR_SCALE_FILL       (pragma::elong "ICON_CURSOR_SCALE_FILL"))
(defconstant ICON_CURSOR_SCALE_RIGHT_FILL (pragma::elong "ICON_CURSOR_SCALE_RIGHT_FILL"))
(defconstant ICON_CURSOR_SCALE_LEFT_FILL  (pragma::elong "ICON_CURSOR_SCALE_LEFT_FILL"))
(defconstant ICON_UNDO_FILL               (pragma::elong "ICON_UNDO_FILL"))
(defconstant ICON_REDO_FILL               (pragma::elong "ICON_REDO_FILL"))
(defconstant ICON_REREDO_FILL             (pragma::elong "ICON_REREDO_FILL"))
(defconstant ICON_MUTATE_FILL             (pragma::elong "ICON_MUTATE_FILL"))
(defconstant ICON_ROTATE_FILL             (pragma::elong "ICON_ROTATE_FILL"))
(defconstant ICON_REPEAT_FILL             (pragma::elong "ICON_REPEAT_FILL"))
(defconstant ICON_SHUFFLE_FILL            (pragma::elong "ICON_SHUFFLE_FILL"))
(defconstant ICON_EMPTYBOX_SMALL          (pragma::elong "ICON_EMPTYBOX_SMALL"))
(defconstant ICON_BOX                     (pragma::elong "ICON_BOX"))
(defconstant ICON_BOX_TOP                 (pragma::elong "ICON_BOX_TOP"))
(defconstant ICON_BOX_TOP_RIGHT           (pragma::elong "ICON_BOX_TOP_RIGHT"))
(defconstant ICON_BOX_RIGHT               (pragma::elong "ICON_BOX_RIGHT"))
(defconstant ICON_BOX_BOTTOM_RIGHT        (pragma::elong "ICON_BOX_BOTTOM_RIGHT"))
(defconstant ICON_BOX_BOTTOM              (pragma::elong "ICON_BOX_BOTTOM"))
(defconstant ICON_BOX_BOTTOM_LEFT         (pragma::elong "ICON_BOX_BOTTOM_LEFT"))
(defconstant ICON_BOX_LEFT                (pragma::elong "ICON_BOX_LEFT"))
(defconstant ICON_BOX_TOP_LEFT            (pragma::elong "ICON_BOX_TOP_LEFT"))
(defconstant ICON_BOX_CENTER              (pragma::elong "ICON_BOX_CENTER"))
(defconstant ICON_BOX_CIRCLE_MASK         (pragma::elong "ICON_BOX_CIRCLE_MASK"))
(defconstant ICON_POT                     (pragma::elong "ICON_POT"))
(defconstant ICON_ALPHA_MULTIPLY          (pragma::elong "ICON_ALPHA_MULTIPLY"))
(defconstant ICON_ALPHA_CLEAR             (pragma::elong "ICON_ALPHA_CLEAR"))
(defconstant ICON_DITHERING               (pragma::elong "ICON_DITHERING"))
(defconstant ICON_MIPMAPS                 (pragma::elong "ICON_MIPMAPS"))
(defconstant ICON_BOX_GRID                (pragma::elong "ICON_BOX_GRID"))
(defconstant ICON_GRID                    (pragma::elong "ICON_GRID"))
(defconstant ICON_BOX_CORNERS_SMALL       (pragma::elong "ICON_BOX_CORNERS_SMALL"))
(defconstant ICON_BOX_CORNERS_BIG         (pragma::elong "ICON_BOX_CORNERS_BIG"))
(defconstant ICON_FOUR_BOXES              (pragma::elong "ICON_FOUR_BOXES"))
(defconstant ICON_GRID_FILL               (pragma::elong "ICON_GRID_FILL"))
(defconstant ICON_BOX_MULTISIZE           (pragma::elong "ICON_BOX_MULTISIZE"))
(defconstant ICON_ZOOM_SMALL              (pragma::elong "ICON_ZOOM_SMALL"))
(defconstant ICON_ZOOM_MEDIUM             (pragma::elong "ICON_ZOOM_MEDIUM"))
(defconstant ICON_ZOOM_BIG                (pragma::elong "ICON_ZOOM_BIG"))
(defconstant ICON_ZOOM_ALL                (pragma::elong "ICON_ZOOM_ALL"))
(defconstant ICON_ZOOM_CENTER             (pragma::elong "ICON_ZOOM_CENTER"))
(defconstant ICON_BOX_DOTS_SMALL          (pragma::elong "ICON_BOX_DOTS_SMALL"))
(defconstant ICON_BOX_DOTS_BIG            (pragma::elong "ICON_BOX_DOTS_BIG"))
(defconstant ICON_BOX_CONCENTRIC          (pragma::elong "ICON_BOX_CONCENTRIC"))
(defconstant ICON_BOX_GRID_BIG            (pragma::elong "ICON_BOX_GRID_BIG"))
(defconstant ICON_OK_TICK                 (pragma::elong "ICON_OK_TICK"))
(defconstant ICON_CROSS                   (pragma::elong "ICON_CROSS"))
(defconstant ICON_ARROW_LEFT              (pragma::elong "ICON_ARROW_LEFT"))
(defconstant ICON_ARROW_RIGHT             (pragma::elong "ICON_ARROW_RIGHT"))
(defconstant ICON_ARROW_DOWN              (pragma::elong "ICON_ARROW_DOWN"))
(defconstant ICON_ARROW_UP                (pragma::elong "ICON_ARROW_UP"))
(defconstant ICON_ARROW_LEFT_FILL         (pragma::elong "ICON_ARROW_LEFT_FILL"))
(defconstant ICON_ARROW_RIGHT_FILL        (pragma::elong "ICON_ARROW_RIGHT_FILL"))
(defconstant ICON_ARROW_DOWN_FILL         (pragma::elong "ICON_ARROW_DOWN_FILL"))
(defconstant ICON_ARROW_UP_FILL           (pragma::elong "ICON_ARROW_UP_FILL"))
(defconstant ICON_AUDIO                   (pragma::elong "ICON_AUDIO"))
(defconstant ICON_FX                      (pragma::elong "ICON_FX"))
(defconstant ICON_WAVE                    (pragma::elong "ICON_WAVE"))
(defconstant ICON_WAVE_SINUS              (pragma::elong "ICON_WAVE_SINUS"))
(defconstant ICON_WAVE_SQUARE             (pragma::elong "ICON_WAVE_SQUARE"))
(defconstant ICON_WAVE_TRIANGULAR         (pragma::elong "ICON_WAVE_TRIANGULAR"))
(defconstant ICON_CROSS_SMALL             (pragma::elong "ICON_CROSS_SMALL"))
(defconstant ICON_PLAYER_PREVIOUS         (pragma::elong "ICON_PLAYER_PREVIOUS"))
(defconstant ICON_PLAYER_PLAY_BACK        (pragma::elong "ICON_PLAYER_PLAY_BACK"))
(defconstant ICON_PLAYER_PLAY             (pragma::elong "ICON_PLAYER_PLAY"))
(defconstant ICON_PLAYER_PAUSE            (pragma::elong "ICON_PLAYER_PAUSE"))
(defconstant ICON_PLAYER_STOP             (pragma::elong "ICON_PLAYER_STOP"))
(defconstant ICON_PLAYER_NEXT             (pragma::elong "ICON_PLAYER_NEXT"))
(defconstant ICON_PLAYER_RECORD           (pragma::elong "ICON_PLAYER_RECORD"))
(defconstant ICON_MAGNET                  (pragma::elong "ICON_MAGNET"))
(defconstant ICON_LOCK_CLOSE              (pragma::elong "ICON_LOCK_CLOSE"))
(defconstant ICON_LOCK_OPEN               (pragma::elong "ICON_LOCK_OPEN"))
(defconstant ICON_CLOCK                   (pragma::elong "ICON_CLOCK"))
(defconstant ICON_TOOLS                   (pragma::elong "ICON_TOOLS"))
(defconstant ICON_GEAR                    (pragma::elong "ICON_GEAR"))
(defconstant ICON_GEAR_BIG                (pragma::elong "ICON_GEAR_BIG"))
(defconstant ICON_BIN                     (pragma::elong "ICON_BIN"))
(defconstant ICON_HAND_POINTER            (pragma::elong "ICON_HAND_POINTER"))
(defconstant ICON_LASER                   (pragma::elong "ICON_LASER"))
(defconstant ICON_COIN                    (pragma::elong "ICON_COIN"))
(defconstant ICON_EXPLOSION               (pragma::elong "ICON_EXPLOSION"))
(defconstant ICON_1UP                     (pragma::elong "ICON_1UP"))
(defconstant ICON_PLAYER                  (pragma::elong "ICON_PLAYER"))
(defconstant ICON_PLAYER_JUMP             (pragma::elong "ICON_PLAYER_JUMP"))
(defconstant ICON_KEY                     (pragma::elong "ICON_KEY"))
(defconstant ICON_DEMON                   (pragma::elong "ICON_DEMON"))
(defconstant ICON_TEXT_POPUP              (pragma::elong "ICON_TEXT_POPUP"))
(defconstant ICON_GEAR_EX                 (pragma::elong "ICON_GEAR_EX"))
(defconstant ICON_CRACK                   (pragma::elong "ICON_CRACK"))
(defconstant ICON_CRACK_POINTS            (pragma::elong "ICON_CRACK_POINTS"))
(defconstant ICON_STAR                    (pragma::elong "ICON_STAR"))
(defconstant ICON_DOOR                    (pragma::elong "ICON_DOOR"))
(defconstant ICON_EXIT                    (pragma::elong "ICON_EXIT"))
(defconstant ICON_MODE_2D                 (pragma::elong "ICON_MODE_2D"))
(defconstant ICON_MODE_3D                 (pragma::elong "ICON_MODE_3D"))
(defconstant ICON_CUBE                    (pragma::elong "ICON_CUBE"))
(defconstant ICON_CUBE_FACE_TOP           (pragma::elong "ICON_CUBE_FACE_TOP"))
(defconstant ICON_CUBE_FACE_LEFT          (pragma::elong "ICON_CUBE_FACE_LEFT"))
(defconstant ICON_CUBE_FACE_FRONT         (pragma::elong "ICON_CUBE_FACE_FRONT"))
(defconstant ICON_CUBE_FACE_BOTTOM        (pragma::elong "ICON_CUBE_FACE_BOTTOM"))
(defconstant ICON_CUBE_FACE_RIGHT         (pragma::elong "ICON_CUBE_FACE_RIGHT"))
(defconstant ICON_CUBE_FACE_BACK          (pragma::elong "ICON_CUBE_FACE_BACK"))
(defconstant ICON_CAMERA                  (pragma::elong "ICON_CAMERA"))
(defconstant ICON_SPECIAL                 (pragma::elong "ICON_SPECIAL"))
(defconstant ICON_LINK_NET                (pragma::elong "ICON_LINK_NET"))
(defconstant ICON_LINK_BOXES              (pragma::elong "ICON_LINK_BOXES"))
(defconstant ICON_LINK_MULTI              (pragma::elong "ICON_LINK_MULTI"))
(defconstant ICON_LINK                    (pragma::elong "ICON_LINK"))
(defconstant ICON_LINK_BROKE              (pragma::elong "ICON_LINK_BROKE"))
(defconstant ICON_TEXT_NOTES              (pragma::elong "ICON_TEXT_NOTES"))
(defconstant ICON_NOTEBOOK                (pragma::elong "ICON_NOTEBOOK"))
(defconstant ICON_SUITCASE                (pragma::elong "ICON_SUITCASE"))
(defconstant ICON_SUITCASE_ZIP            (pragma::elong "ICON_SUITCASE_ZIP"))
(defconstant ICON_MAILBOX                 (pragma::elong "ICON_MAILBOX"))
(defconstant ICON_MONITOR                 (pragma::elong "ICON_MONITOR"))
(defconstant ICON_PRINTER                 (pragma::elong "ICON_PRINTER"))
(defconstant ICON_PHOTO_CAMERA            (pragma::elong "ICON_PHOTO_CAMERA"))
(defconstant ICON_PHOTO_CAMERA_FLASH      (pragma::elong "ICON_PHOTO_CAMERA_FLASH"))
(defconstant ICON_HOUSE                   (pragma::elong "ICON_HOUSE"))
(defconstant ICON_HEART                   (pragma::elong "ICON_HEART"))
(defconstant ICON_CORNER                  (pragma::elong "ICON_CORNER"))
(defconstant ICON_VERTICAL_BARS           (pragma::elong "ICON_VERTICAL_BARS"))
(defconstant ICON_VERTICAL_BARS_FILL      (pragma::elong "ICON_VERTICAL_BARS_FILL"))
(defconstant ICON_LIFE_BARS               (pragma::elong "ICON_LIFE_BARS"))
(defconstant ICON_INFO                    (pragma::elong "ICON_INFO"))
(defconstant ICON_CROSSLINE               (pragma::elong "ICON_CROSSLINE"))
(defconstant ICON_HELP                    (pragma::elong "ICON_HELP"))
(defconstant ICON_FILETYPE_ALPHA          (pragma::elong "ICON_FILETYPE_ALPHA"))
(defconstant ICON_FILETYPE_HOME           (pragma::elong "ICON_FILETYPE_HOME"))
(defconstant ICON_LAYERS_VISIBLE          (pragma::elong "ICON_LAYERS_VISIBLE"))
(defconstant ICON_LAYERS                  (pragma::elong "ICON_LAYERS"))
(defconstant ICON_WINDOW                  (pragma::elong "ICON_WINDOW"))
(defconstant ICON_HIDPI                   (pragma::elong "ICON_HIDPI"))
(defconstant ICON_FILETYPE_BINARY         (pragma::elong "ICON_FILETYPE_BINARY"))
(defconstant ICON_HEX                     (pragma::elong "ICON_HEX"))
(defconstant ICON_SHIELD                  (pragma::elong "ICON_SHIELD"))
(defconstant ICON_FILE_NEW                (pragma::elong "ICON_FILE_NEW"))
(defconstant ICON_FOLDER_ADD              (pragma::elong "ICON_FOLDER_ADD"))
(defconstant ICON_ALARM                   (pragma::elong "ICON_ALARM"))
(defconstant ICON_CPU                     (pragma::elong "ICON_CPU"))
(defconstant ICON_ROM                     (pragma::elong "ICON_ROM"))
(defconstant ICON_STEP_OVER               (pragma::elong "ICON_STEP_OVER"))
(defconstant ICON_STEP_INTO               (pragma::elong "ICON_STEP_INTO"))
(defconstant ICON_STEP_OUT                (pragma::elong "ICON_STEP_OUT"))
(defconstant ICON_RESTART                 (pragma::elong "ICON_RESTART"))
(defconstant ICON_BREAKPOINT_ON           (pragma::elong "ICON_BREAKPOINT_ON"))
(defconstant ICON_BREAKPOINT_OFF          (pragma::elong "ICON_BREAKPOINT_OFF"))
(defconstant ICON_BURGER_MENU             (pragma::elong "ICON_BURGER_MENU"))
(defconstant ICON_CASE_SENSITIVE          (pragma::elong "ICON_CASE_SENSITIVE"))
(defconstant ICON_REG_EXP                 (pragma::elong "ICON_REG_EXP"))
(defconstant ICON_FOLDER                  (pragma::elong "ICON_FOLDER"))
(defconstant ICON_FILE                    (pragma::elong "ICON_FILE"))
(defconstant ICON_SAND_TIMER              (pragma::elong "ICON_SAND_TIMER"))
(defconstant ICON_220                     (pragma::elong "ICON_220"))
(defconstant ICON_221                     (pragma::elong "ICON_221"))
(defconstant ICON_222                     (pragma::elong "ICON_222"))
(defconstant ICON_223                     (pragma::elong "ICON_223"))
(defconstant ICON_224                     (pragma::elong "ICON_224"))
(defconstant ICON_225                     (pragma::elong "ICON_225"))
(defconstant ICON_226                     (pragma::elong "ICON_226"))
(defconstant ICON_227                     (pragma::elong "ICON_227"))
(defconstant ICON_228                     (pragma::elong "ICON_228"))
(defconstant ICON_229                     (pragma::elong "ICON_229"))
(defconstant ICON_230                     (pragma::elong "ICON_230"))
(defconstant ICON_231                     (pragma::elong "ICON_231"))
(defconstant ICON_232                     (pragma::elong "ICON_232"))
(defconstant ICON_233                     (pragma::elong "ICON_233"))
(defconstant ICON_234                     (pragma::elong "ICON_234"))
(defconstant ICON_235                     (pragma::elong "ICON_235"))
(defconstant ICON_236                     (pragma::elong "ICON_236"))
(defconstant ICON_237                     (pragma::elong "ICON_237"))
(defconstant ICON_238                     (pragma::elong "ICON_238"))
(defconstant ICON_239                     (pragma::elong "ICON_239"))
(defconstant ICON_240                     (pragma::elong "ICON_240"))
(defconstant ICON_241                     (pragma::elong "ICON_241"))
(defconstant ICON_242                     (pragma::elong "ICON_242"))
(defconstant ICON_243                     (pragma::elong "ICON_243"))
(defconstant ICON_244                     (pragma::elong "ICON_244"))
(defconstant ICON_245                     (pragma::elong "ICON_245"))
(defconstant ICON_246                     (pragma::elong "ICON_246"))
(defconstant ICON_247                     (pragma::elong "ICON_247"))
(defconstant ICON_248                     (pragma::elong "ICON_248"))
(defconstant ICON_249                     (pragma::elong "ICON_249"))
(defconstant ICON_250                     (pragma::elong "ICON_250"))
(defconstant ICON_251                     (pragma::elong "ICON_251"))
(defconstant ICON_252                     (pragma::elong "ICON_252"))
(defconstant ICON_253                     (pragma::elong "ICON_253"))
(defconstant ICON_254                     (pragma::elong "ICON_254"))
(defconstant ICON_255                     (pragma::elong "ICON_255"))


; Global gui state control functions

(defbuiltin (guienable)
    (pragma "GuiEnable()")
    NULL)

(defbuiltin (guidisable)
    (pragma "GuiDisable()")
    NULL)

(defbuiltin (guilock)
    (pragma "GuiLock()")
    NULL)

(defbuiltin (guiunlock)
    (pragma "GuiUnlock()")
    NULL)

(defbuiltin (guiislocked)
    (pragma::bool "GuiIsLocked()"))

(defbuiltin (guisetalpha alpha)
    (unless (flonum? alpha)
        (set! alpha (mkflonumw 'GuiSetAlpha 1 alpha)))
    (when alpha
        (pragma "GuiSetAlpha((float)$1)" ($real->double alpha))
        NULL))

(defbuiltin (guisetstate state)
    (unless (elong? state)
        (set! state (mkelongw 'GuiSetState 1 state)))
    (when state
        (pragma "GuiSetState((int)$1)" ($belong->elong state))
        NULL))

(defbuiltin (guigetstate)
    (pragma::elong "GuiGetState()"))

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

; Styles loading functions

(defbuiltin (guiloadstyle fileName)
    (set! fileName (mkpathw 'GuiLoadStyle 1 fileName))
    (when fileName
        (pragma "GuiLoadStyle($1)" ($bstring->string fileName))
        NULL))

(defbuiltin (guiloadstyledefault)
    (pragma "GuiLoadStyleDefault()")
    NULL)

; Icons functionality

(defbuiltin (guiicontext iconId text)
    (unless (elong? iconId)
        (set! iconId (mkelongw 'GuiIconText 1 iconId)))
    (when iconId
        (unless (string? text)
            (set! text (mkstrw 'GuiIconText 2 text)))
        (when text
            (pragma::string "(char *)GuiIconText((int)$1, $2)"
                            ($belong->elong iconId)
                            ($bstring->string text)))))

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
        (unless (or (null? text)
                    (string? text))
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
                                (pragma "result = GuiSpinner(bounds, NULLP($1) ? NULL : BSTRING_TO_STRING($1), &value, (int)$2, (int)$3, $4 == BTRUE)"
                                        text
                                        ($belong->elong minValue)
                                        ($belong->elong maxValue)
                                        editMode)
                                (container-value-set! value (pragma::elong "value"))
                                (pragma::elong "result")))))))))

; return #t
(defbuiltin (guivaluebox bounds text (ref . value) minValue maxValue editMode)
    (%with-c-bounds 'GuiValueBox
        (unless (or (null? text)
                    (string? text))
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
                                (pragma "result = GuiValueBox(bounds, NULLP($1) ? NULL : BSTRING_TO_STRING($1), &value, (int)$2, (int)$3, $4 == BTRUE)"
                                        text
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
; -1: no action
;  0: close
;  1: button 1
;  2: button 2
;  N: button N
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
        (unless (or (null? text)
                    (string? text))
            (set! text (mkstrw 'GuiColorPicker 2 text)))
        (when text
            (let ((color-val (container-value color)))
                (pragma "Color c")
                (when (or (null? color-val)
                          (%init-c-color 'GuiColorPicker 3 color-val "c"))
                    (pragma "GuiColorPicker(bounds, NULLP($1) ? NULL : BSTRING_TO_STRING($1), &c)"
                            text)
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
