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

while (!$exitWindow)
{
    // Update
    $exitWindow = WindowShouldClose();
    if (IsKeyPressed(KEY_ESCAPE)) {
        $showMessageBox = !$showMessageBox;
    }

    // Draw
    BeginDrawing();
        ClearBackground(GetColor(GuiGetStyle(GUI_CONTROL_DEFAULT, BACKGROUND_COLOR)));

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

    EndDrawing();
}

CloseWindow();
