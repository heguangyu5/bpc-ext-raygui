<?php

InitWindow(400, 200, "raygui - controls test suite");
SetTargetFPS(60);

$showMessageBox = false;

while (!WindowShouldClose())
{
    BeginDrawing();
        ClearBackground(GetColor(GuiGetStyle(GUI_CONTROL_DEFAULT, BACKGROUND_COLOR)));

        if (GuiButton(array(24, 24, 120, 30), "#191#Show Message")) $showMessageBox = true;

        if ($showMessageBox)
        {
            $result = GuiMessageBox(
                array(85, 70, 250, 100),
                "#191#Message Box",
                "Hi! This is a message!",
                "Nice;Cool"
            );

            if ($result >= 0) $showMessageBox = false;
        }

    EndDrawing();
}

CloseWindow();
