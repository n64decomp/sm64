//Not gonna name it .inc.c because of makefile.
//This file will have more layouts for dynamic controls later.

//DEFAULT
struct Position GetDefaultJoystickPos() {
    struct Position ret = { .x = GFX_DIMENSIONS_RECT_FROM_LEFT_EDGE(60) << 2, .y = 720 };
    return ret;
}

struct Position GetDefaultStartPos() {
    struct Position ret = { .x = SCREEN_WIDTH_API / 2 + 68, .y = 850 };
    return ret;
}

struct Position GetDefaultMenuPos() {
    struct Position ret = { .x = SCREEN_WIDTH_API / 2 - 68, .y = 850 };
    return ret;
}

struct Position GetDefaultAPos() {
    struct Position ret = { .x = GFX_DIMENSIONS_RECT_FROM_RIGHT_EDGE(40) << 2, .y = 600 };
    return ret;
}

struct Position GetDefaultBPos() {
    struct Position ret = { .x = GFX_DIMENSIONS_RECT_FROM_RIGHT_EDGE(75) << 2, .y = 600 };
    return ret;
}

struct Position GetDefaultZPos() {
    struct Position ret = { .x = GFX_DIMENSIONS_RECT_FROM_RIGHT_EDGE(40) << 2, .y = 740 };
    return ret;
}

struct Position GetDefaultLPos() {
    struct Position ret = { .x = GFX_DIMENSIONS_RECT_FROM_LEFT_EDGE(40) << 2, .y = 170 };
    return ret;
}

struct Position GetDefaultRPos() {
    struct Position ret = { .x = GFX_DIMENSIONS_RECT_FROM_LEFT_EDGE(75) << 2, .y = 170 };
    return ret;
}

struct Position GetDefaultUpPos() {
    struct Position ret = { .x = GFX_DIMENSIONS_RECT_FROM_RIGHT_EDGE(70) << 2, .y = 170 };
    return ret;
}

struct Position GetDefaultDownPos() {
    struct Position ret = { .x = GFX_DIMENSIONS_RECT_FROM_RIGHT_EDGE(70) << 2, .y = 410 };
    return ret;
}

struct Position GetDefaultLeftPos() {
    struct Position ret = { .x = GFX_DIMENSIONS_RECT_FROM_RIGHT_EDGE(100) << 2, .y = 290 };
    return ret;
}

struct Position GetDefaultRightPos() {
    struct Position ret = { .x = GFX_DIMENSIONS_RECT_FROM_RIGHT_EDGE(40) << 2, .y = 290 };
    return ret;
}

static struct ControlElement ControlElementsDefault[] = {
{.type = Joystick, .name = "Joystick", .buttonID = 69420},
{.type = Button, .name = "Start", .buttonID = START_BUTTON},
{.type = Button, .name = "Menu", .menuButton = 1, .buttonID = 69},
{.type = Button, .name = "A", .buttonID = A_BUTTON},
{.type = Button, .name = "B", .buttonID = B_BUTTON},
{.type = Button, .name = "Z", .buttonID = Z_TRIG},
{.type = Button, .name = "L", .buttonID = L_TRIG},
{.type = Button, .name = "R", .buttonID = R_TRIG},
{.type = Button, .name = "Up", .buttonID = U_CBUTTONS},
{.type = Button, .name = "Down", .buttonID = D_CBUTTONS},
{.type = Button, .name = "Left", .buttonID = L_CBUTTONS},
{.type = Button, .name = "Right", .buttonID = R_CBUTTONS}
};
