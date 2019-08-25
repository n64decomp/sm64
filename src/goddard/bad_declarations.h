#ifndef BAD_GD_DECLARATIONS_H
#define BAD_GD_DECLARATIONS_H

#include <config.h>
#include "gd_types.h"

/**
 * @file bad_declarations.h
 *
 * Match incorrect type promotion for two declared functions.
 *
 * There is an issue with the compiled code for these function calls in files
 * outside of the files in which they were defined.
 * The only possible reason I can come up with for this behavior is that
 * goddard only declared (not prototyped) his functions in the headers,
 * and didn't include the header in the function's defining .c file
 * (Even ido 5.0 cares about illegal promotion of types!)
 *
 * Since that's an awful practice to emulate, include this file (first!) to prevent
 * the proper prototypes of these functions from being seen by files with the
 * the incorrectly compiled calls.
*/

#if !BUGFIX_GODDARD_BAD_DECLARATIONS

#define GD_USE_BAD_DECLARATIONS 1

/* half6 */ 
extern struct ObjFace *make_face_with_colour(); 
/* should be: make_face_with_colour(f32, f32, f32) */

/* oldobj */
extern struct ObjLabel *make_label();
/* should be: make_label(struct ObjValPtrs *, char *, s32, f32, f32, f32) */

#endif /* !BUGFIX_GODDARD_BAD_DECLARATIONS */
#endif /* BAD_GD_DECLARATIONS_H */
