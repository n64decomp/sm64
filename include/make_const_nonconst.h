#ifndef MAKE_CONST_NONCONST_H
#define MAKE_CONST_NONCONST_H

#ifdef __sgi
// IDO sometimes puts const variables in .rodata and sometimes in .data, which breaks ordering.
// This makes sure all variables are put into the same section (.data).
#define const
#endif

#endif
