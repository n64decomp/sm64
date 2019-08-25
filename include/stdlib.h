#ifndef _STDLIB_H_
#define _STDLIB_H_

typedef struct lldiv_t
{
    long long quot;
    long long rem;
} lldiv_t;

typedef struct ldiv_t
{
    long quot;
    long rem;
} ldiv_t;

lldiv_t lldiv(long long, long long);
ldiv_t ldiv(long, long);

#endif
