<?php

InitWindow(960, 560, "raygui - controls test suite");
SetExitKey(0);
SetTargetFPS(60);

$exitWindow = false;
$showMessageBox = false;

$dropdownBox000Active = 0;
$dropdownBox000EditMode = false;

$dropdownBox001Active = 0;
$dropdownBox001EditMode = false;

$forceSquaredChecked = false;

$spinnerValue = 0;
$spinnerEditMode = false;

$valueBoxValue = 0;
$valueBoxEditMode = false;

$textBuf = str_pad("Text box", 64, "\0");
$filledLen = 0;
$textBoxEditMode = false;

$showTextInputBox = false;
$textInputBuf = str_repeat("\0", 256);
$textInputFilledLen = 0;

while (!$exitWindow)
{
    // Update
    $exitWindow = WindowShouldClose();
    if (IsKeyPressed(KEY_ESCAPE)) {
        $showMessageBox = !$showMessageBox;
    }
    if (IsKeyPressed(KEY_LEFT_CONTROL) && IsKeyPressed(KEY_S)) {
        $showTextInputBox = true;
    }

    // Draw
    BeginDrawing();
        ClearBackground(GetColor(GuiGetStyle(GUI_CONTROL_DEFAULT, BACKGROUND_COLOR)));

        // First GUI column ---------------------------------------------

        GuiCheckBox(array(25, 108, 15, 15), "FORCE CHECK!", $forceSquaredChecked);

        GuiSetStyle(TEXTBOX, TEXT_ALIGNMENT, TEXT_ALIGN_CENTER);
        if (GuiSpinner(array(25, 135, 125, 30), NULL, $spinnerValue, 0, 100, $spinnerEditMode)) {
            $spinnerEditMode = !$spinnerEditMode;
        }
        if (GuiValueBox(array(25, 175, 125, 30), NULL, $valueBoxValue, 0, 100, $valueBoxEditMode)) {
            $valueBoxEditMode = !$valueBoxEditMode;
        }
        GuiSetStyle(TEXTBOX, TEXT_ALIGNMENT, TEXT_ALIGN_LEFT);

        if (GuiTextBox(array(25, 215, 125, 30), $textBuf, $filledLen, $textBoxEditMode)) {
            $textBoxEditMode = !$textBoxEditMode;
        }

        if (GuiButton(array(25, 255, 125, 30), GuiIconText(ICON_FILE_SAVE, "Save File"))) {
            $showTextInputBox = true;
        }

        GuiGroupBox(array(25, 310, 125, 150), "STATES");
        GuiSetState(STATE_NORMAL);
        GuiButton(array(30, 320, 115, 30), "NORMAL");
        GuiSetState(STATE_FOCUSED);
        GuiButton(array(30, 355, 115, 30), "FOCUSED");
        GuiSetState(STATE_PRESSED);
        GuiButton(array(30, 390, 115, 30), "#15#PRESSED");
        GuiSetState(STATE_DISABLED);
        GuiButton(array(30, 425, 115, 30), "DISABLED");
        GuiSetState(STATE_NORMAL);

        GuiSetStyle(DROPDOWNBOX, TEXT_PADDING, 4);
        GuiSetStyle(DROPDOWNBOX, TEXT_ALIGNMENT, TEXT_ALIGN_LEFT);
        if (GuiDropdownBox(array(25, 65, 125, 30), "#01#ONE;#02#TWO;#03#THREE;#04#FOUR", $dropdownBox001Active, $dropdownBox001EditMode)) {
            $dropdownBox001EditMode = !$dropdownBox001EditMode;
        }
        GuiSetStyle(DROPDOWNBOX, TEXT_ALIGNMENT, TEXT_ALIGN_CENTER);
        GuiSetStyle(DROPDOWNBOX, TEXT_PADDING, 0);

        if (GuiDropdownBox(array(25, 25, 125, 30), "ONE;TWO;THREE", $dropdownBox000Active, $dropdownBox000EditMode)) {
            $dropdownBox000EditMode = !$dropdownBox000EditMode;
        }

        if ($showMessageBox) {
            DrawRectangle(0, 0, GetScreenWidth(), GetScreenHeight(), Fade(RAYWHITE, 0.8));
            $result = GuiMessageBox(
                array(
                    GetScreenWidth()/2 - 125, // x
                    GetScreenHeight()/2 - 50, // y
                    250,
                    100
                ),
                GuiIconText(ICON_EXIT, "Close Window"),
                "Do you really want to exit?",
                "Yes;No"
            );
            if ($result == 0 || $result == 2) {
                $showMessageBox = false;
            } elseif ($result == 1) {
                $exitWindow = true;
            }
        }

        if ($showTextInputBox) {
            DrawRectangle(0, 0, GetScreenWidth(), GetScreenHeight(), Fade(RAYWHITE, 0.8));
            $result = GuiTextInputBox(
                array(
                    GetScreenWidth()/2 - 120, // x
                    GetScreenHeight()/2 - 60,
                    240,
                    140
                ),
                GuiIconText(ICON_FILE_SAVE, "Save file as..."),
                "Introduce output file name:",
                "Ok;Cancel",
                $textInputBuf,
                $textInputFilledLen
            );
            if ($result == 1) {
                echo "should save to ", substr($textInputBuf, 0, $textInputFilledLen), "\n";
            }
            if ($result == 0 || $result == 1 || $result == 2) {
                $showTextInputBox = false;
                $textInputBuf[0] = "\0";
            }
        }

    EndDrawing();
}

CloseWindow();
