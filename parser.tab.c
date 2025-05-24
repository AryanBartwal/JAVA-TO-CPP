/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison implementation for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output, and Bison version.  */
#define YYBISON 30802

/* Bison version string.  */
#define YYBISON_VERSION "3.8.2"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1




/* First part of user prologue.  */
#line 1 "parser.y"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
void yyerror(const char *s) { fprintf(stderr, "Error: %s\n", s); }
int yylex();

#line 79 "parser.tab.c"

# ifndef YY_CAST
#  ifdef __cplusplus
#   define YY_CAST(Type, Val) static_cast<Type> (Val)
#   define YY_REINTERPRET_CAST(Type, Val) reinterpret_cast<Type> (Val)
#  else
#   define YY_CAST(Type, Val) ((Type) (Val))
#   define YY_REINTERPRET_CAST(Type, Val) ((Type) (Val))
#  endif
# endif
# ifndef YY_NULLPTR
#  if defined __cplusplus
#   if 201103L <= __cplusplus
#    define YY_NULLPTR nullptr
#   else
#    define YY_NULLPTR 0
#   endif
#  else
#   define YY_NULLPTR ((void*)0)
#  endif
# endif

#include "parser.tab.h"
/* Symbol kind.  */
enum yysymbol_kind_t
{
  YYSYMBOL_YYEMPTY = -2,
  YYSYMBOL_YYEOF = 0,                      /* "end of file"  */
  YYSYMBOL_YYerror = 1,                    /* error  */
  YYSYMBOL_YYUNDEF = 2,                    /* "invalid token"  */
  YYSYMBOL_STRLIT = 3,                     /* STRLIT  */
  YYSYMBOL_ID = 4,                         /* ID  */
  YYSYMBOL_PUBLIC = 5,                     /* PUBLIC  */
  YYSYMBOL_CLASS = 6,                      /* CLASS  */
  YYSYMBOL_STATIC = 7,                     /* STATIC  */
  YYSYMBOL_VOID = 8,                       /* VOID  */
  YYSYMBOL_MAIN = 9,                       /* MAIN  */
  YYSYMBOL_STRING = 10,                    /* STRING  */
  YYSYMBOL_PRINT = 11,                     /* PRINT  */
  YYSYMBOL_LPAREN = 12,                    /* LPAREN  */
  YYSYMBOL_RPAREN = 13,                    /* RPAREN  */
  YYSYMBOL_LBRACE = 14,                    /* LBRACE  */
  YYSYMBOL_RBRACE = 15,                    /* RBRACE  */
  YYSYMBOL_SEMICOLON = 16,                 /* SEMICOLON  */
  YYSYMBOL_ARR = 17,                       /* ARR  */
  YYSYMBOL_LSQUARE = 18,                   /* LSQUARE  */
  YYSYMBOL_RSQUARE = 19,                   /* RSQUARE  */
  YYSYMBOL_INT = 20,                       /* INT  */
  YYSYMBOL_ASSIGN = 21,                    /* ASSIGN  */
  YYSYMBOL_NUMBER = 22,                    /* NUMBER  */
  YYSYMBOL_CHAR = 23,                      /* CHAR  */
  YYSYMBOL_FLOAT = 24,                     /* FLOAT  */
  YYSYMBOL_DOUBLE = 25,                    /* DOUBLE  */
  YYSYMBOL_FLOATNUM = 26,                  /* FLOATNUM  */
  YYSYMBOL_CHARLIT = 27,                   /* CHARLIT  */
  YYSYMBOL_PLUS = 28,                      /* PLUS  */
  YYSYMBOL_MINUS = 29,                     /* MINUS  */
  YYSYMBOL_TIMES = 30,                     /* TIMES  */
  YYSYMBOL_DIVIDE = 31,                    /* DIVIDE  */
  YYSYMBOL_IF = 32,                        /* IF  */
  YYSYMBOL_ELSE = 33,                      /* ELSE  */
  YYSYMBOL_EQ = 34,                        /* EQ  */
  YYSYMBOL_NEQ = 35,                       /* NEQ  */
  YYSYMBOL_AND = 36,                       /* AND  */
  YYSYMBOL_OR = 37,                        /* OR  */
  YYSYMBOL_FOR = 38,                       /* FOR  */
  YYSYMBOL_WHILE = 39,                     /* WHILE  */
  YYSYMBOL_DO = 40,                        /* DO  */
  YYSYMBOL_MINUSMINUS = 41,                /* MINUSMINUS  */
  YYSYMBOL_PLUSPLUS = 42,                  /* PLUSPLUS  */
  YYSYMBOL_LE = 43,                        /* LE  */
  YYSYMBOL_GE = 44,                        /* GE  */
  YYSYMBOL_LT = 45,                        /* LT  */
  YYSYMBOL_46_ = 46,                       /* '>'  */
  YYSYMBOL_47_ = 47,                       /* '<'  */
  YYSYMBOL_YYACCEPT = 48,                  /* $accept  */
  YYSYMBOL_program = 49,                   /* program  */
  YYSYMBOL_array_param = 50,               /* array_param  */
  YYSYMBOL_statements = 51,                /* statements  */
  YYSYMBOL_statements_or_empty = 52,       /* statements_or_empty  */
  YYSYMBOL_statement = 53,                 /* statement  */
  YYSYMBOL_for_init = 54,                  /* for_init  */
  YYSYMBOL_for_incr = 55,                  /* for_incr  */
  YYSYMBOL_if_stmt = 56,                   /* if_stmt  */
  YYSYMBOL_else_part = 57,                 /* else_part  */
  YYSYMBOL_block = 58,                     /* block  */
  YYSYMBOL_expr = 59,                      /* expr  */
  YYSYMBOL_cond = 60                       /* cond  */
};
typedef enum yysymbol_kind_t yysymbol_kind_t;




#ifdef short
# undef short
#endif

/* On compilers that do not define __PTRDIFF_MAX__ etc., make sure
   <limits.h> and (if available) <stdint.h> are included
   so that the code can choose integer types of a good width.  */

#ifndef __PTRDIFF_MAX__
# include <limits.h> /* INFRINGES ON USER NAME SPACE */
# if defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stdint.h> /* INFRINGES ON USER NAME SPACE */
#  define YY_STDINT_H
# endif
#endif

/* Narrow types that promote to a signed type and that can represent a
   signed or unsigned integer of at least N bits.  In tables they can
   save space and decrease cache pressure.  Promoting to a signed type
   helps avoid bugs in integer arithmetic.  */

#ifdef __INT_LEAST8_MAX__
typedef __INT_LEAST8_TYPE__ yytype_int8;
#elif defined YY_STDINT_H
typedef int_least8_t yytype_int8;
#else
typedef signed char yytype_int8;
#endif

#ifdef __INT_LEAST16_MAX__
typedef __INT_LEAST16_TYPE__ yytype_int16;
#elif defined YY_STDINT_H
typedef int_least16_t yytype_int16;
#else
typedef short yytype_int16;
#endif

/* Work around bug in HP-UX 11.23, which defines these macros
   incorrectly for preprocessor constants.  This workaround can likely
   be removed in 2023, as HPE has promised support for HP-UX 11.23
   (aka HP-UX 11i v2) only through the end of 2022; see Table 2 of
   <https://h20195.www2.hpe.com/V2/getpdf.aspx/4AA4-7673ENW.pdf>.  */
#ifdef __hpux
# undef UINT_LEAST8_MAX
# undef UINT_LEAST16_MAX
# define UINT_LEAST8_MAX 255
# define UINT_LEAST16_MAX 65535
#endif

#if defined __UINT_LEAST8_MAX__ && __UINT_LEAST8_MAX__ <= __INT_MAX__
typedef __UINT_LEAST8_TYPE__ yytype_uint8;
#elif (!defined __UINT_LEAST8_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST8_MAX <= INT_MAX)
typedef uint_least8_t yytype_uint8;
#elif !defined __UINT_LEAST8_MAX__ && UCHAR_MAX <= INT_MAX
typedef unsigned char yytype_uint8;
#else
typedef short yytype_uint8;
#endif

#if defined __UINT_LEAST16_MAX__ && __UINT_LEAST16_MAX__ <= __INT_MAX__
typedef __UINT_LEAST16_TYPE__ yytype_uint16;
#elif (!defined __UINT_LEAST16_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST16_MAX <= INT_MAX)
typedef uint_least16_t yytype_uint16;
#elif !defined __UINT_LEAST16_MAX__ && USHRT_MAX <= INT_MAX
typedef unsigned short yytype_uint16;
#else
typedef int yytype_uint16;
#endif

#ifndef YYPTRDIFF_T
# if defined __PTRDIFF_TYPE__ && defined __PTRDIFF_MAX__
#  define YYPTRDIFF_T __PTRDIFF_TYPE__
#  define YYPTRDIFF_MAXIMUM __PTRDIFF_MAX__
# elif defined PTRDIFF_MAX
#  ifndef ptrdiff_t
#   include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  endif
#  define YYPTRDIFF_T ptrdiff_t
#  define YYPTRDIFF_MAXIMUM PTRDIFF_MAX
# else
#  define YYPTRDIFF_T long
#  define YYPTRDIFF_MAXIMUM LONG_MAX
# endif
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned
# endif
#endif

#define YYSIZE_MAXIMUM                                  \
  YY_CAST (YYPTRDIFF_T,                                 \
           (YYPTRDIFF_MAXIMUM < YY_CAST (YYSIZE_T, -1)  \
            ? YYPTRDIFF_MAXIMUM                         \
            : YY_CAST (YYSIZE_T, -1)))

#define YYSIZEOF(X) YY_CAST (YYPTRDIFF_T, sizeof (X))


/* Stored state numbers (used for stacks). */
typedef yytype_uint8 yy_state_t;

/* State numbers in computations.  */
typedef int yy_state_fast_t;

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(Msgid) dgettext ("bison-runtime", Msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(Msgid) Msgid
# endif
#endif


#ifndef YY_ATTRIBUTE_PURE
# if defined __GNUC__ && 2 < __GNUC__ + (96 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_PURE __attribute__ ((__pure__))
# else
#  define YY_ATTRIBUTE_PURE
# endif
#endif

#ifndef YY_ATTRIBUTE_UNUSED
# if defined __GNUC__ && 2 < __GNUC__ + (7 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_UNUSED __attribute__ ((__unused__))
# else
#  define YY_ATTRIBUTE_UNUSED
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YY_USE(E) ((void) (E))
#else
# define YY_USE(E) /* empty */
#endif

/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
#if defined __GNUC__ && ! defined __ICC && 406 <= __GNUC__ * 100 + __GNUC_MINOR__
# if __GNUC__ * 100 + __GNUC_MINOR__ < 407
#  define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                           \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")
# else
#  define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                           \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")              \
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
# endif
# define YY_IGNORE_MAYBE_UNINITIALIZED_END      \
    _Pragma ("GCC diagnostic pop")
#else
# define YY_INITIAL_VALUE(Value) Value
#endif
#ifndef YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_END
#endif
#ifndef YY_INITIAL_VALUE
# define YY_INITIAL_VALUE(Value) /* Nothing. */
#endif

#if defined __cplusplus && defined __GNUC__ && ! defined __ICC && 6 <= __GNUC__
# define YY_IGNORE_USELESS_CAST_BEGIN                          \
    _Pragma ("GCC diagnostic push")                            \
    _Pragma ("GCC diagnostic ignored \"-Wuseless-cast\"")
# define YY_IGNORE_USELESS_CAST_END            \
    _Pragma ("GCC diagnostic pop")
#endif
#ifndef YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_END
#endif


#define YY_ASSERT(E) ((void) (0 && (E)))

#if !defined yyoverflow

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's 'empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
             && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* !defined yyoverflow */

#if (! defined yyoverflow \
     && (! defined __cplusplus \
         || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yy_state_t yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (YYSIZEOF (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (YYSIZEOF (yy_state_t) + YYSIZEOF (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)                           \
    do                                                                  \
      {                                                                 \
        YYPTRDIFF_T yynewbytes;                                         \
        YYCOPY (&yyptr->Stack_alloc, Stack, yysize);                    \
        Stack = &yyptr->Stack_alloc;                                    \
        yynewbytes = yystacksize * YYSIZEOF (*Stack) + YYSTACK_GAP_MAXIMUM; \
        yyptr += yynewbytes / YYSIZEOF (*yyptr);                        \
      }                                                                 \
    while (0)

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, YY_CAST (YYSIZE_T, (Count)) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYPTRDIFF_T yyi;                      \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (0)
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  4
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   195

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  48
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  13
/* YYNRULES -- Number of rules.  */
#define YYNRULES  55
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  163

/* YYMAXUTOK -- Last valid token kind.  */
#define YYMAXUTOK   300


/* YYTRANSLATE(TOKEN-NUM) -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, with out-of-bounds checking.  */
#define YYTRANSLATE(YYX)                                \
  (0 <= (YYX) && (YYX) <= YYMAXUTOK                     \
   ? YY_CAST (yysymbol_kind_t, yytranslate[YYX])        \
   : YYSYMBOL_YYUNDEF)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex.  */
static const yytype_int8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
      47,     2,    46,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45
};

#if YYDEBUG
/* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_int16 yyrline[] =
{
       0,    43,    43,    49,    50,    51,    52,    53,    57,    66,
      70,    71,    75,    82,    89,    96,   104,   112,   120,   128,
     136,   144,   152,   160,   161,   168,   175,   182,   192,   199,
     209,   216,   223,   230,   237,   248,   258,   265,   272,   276,
     286,   287,   288,   289,   296,   303,   310,   320,   321,   328,
     335,   342,   349,   356,   363,   370
};
#endif

/** Accessing symbol of state STATE.  */
#define YY_ACCESSING_SYMBOL(State) YY_CAST (yysymbol_kind_t, yystos[State])

#if YYDEBUG || 0
/* The user-facing name of the symbol whose (internal) number is
   YYSYMBOL.  No bounds checking.  */
static const char *yysymbol_name (yysymbol_kind_t yysymbol) YY_ATTRIBUTE_UNUSED;

/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "\"end of file\"", "error", "\"invalid token\"", "STRLIT", "ID",
  "PUBLIC", "CLASS", "STATIC", "VOID", "MAIN", "STRING", "PRINT", "LPAREN",
  "RPAREN", "LBRACE", "RBRACE", "SEMICOLON", "ARR", "LSQUARE", "RSQUARE",
  "INT", "ASSIGN", "NUMBER", "CHAR", "FLOAT", "DOUBLE", "FLOATNUM",
  "CHARLIT", "PLUS", "MINUS", "TIMES", "DIVIDE", "IF", "ELSE", "EQ", "NEQ",
  "AND", "OR", "FOR", "WHILE", "DO", "MINUSMINUS", "PLUSPLUS", "LE", "GE",
  "LT", "'>'", "'<'", "$accept", "program", "array_param", "statements",
  "statements_or_empty", "statement", "for_init", "for_incr", "if_stmt",
  "else_part", "block", "expr", "cond", YY_NULLPTR
};

static const char *
yysymbol_name (yysymbol_kind_t yysymbol)
{
  return yytname[yysymbol];
}
#endif

#define YYPACT_NINF (-120)

#define yypact_value_is_default(Yyn) \
  ((Yyn) == YYPACT_NINF)

#define YYTABLE_NINF (-1)

#define yytable_value_is_error(Yyn) \
  0

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
static const yytype_int16 yypact[] =
{
       4,     5,    17,    29,  -120,    24,    38,    34,    73,    83,
      57,    88,   117,    55,    99,    89,   100,  -120,   110,  -120,
     132,   123,  -120,  -120,    36,   118,   126,   140,   141,   142,
     143,   136,   137,   138,   139,   144,    36,  -120,    40,    20,
     130,   131,   133,   134,    40,     0,    41,    36,   145,  -120,
    -120,  -120,  -120,    86,   148,   149,    66,    60,   129,    61,
      67,    76,   -10,   146,   153,   147,   113,    -8,  -120,   150,
    -120,  -120,    40,    40,    40,    40,   152,   154,   155,   156,
      96,   157,   158,   102,   159,   112,    40,    40,    40,    40,
      40,    40,   162,    40,    40,    40,   160,    40,   161,   163,
     125,   -15,   -15,   -15,   -15,  -120,  -120,  -120,  -120,  -120,
    -120,  -120,  -120,  -120,  -120,   -15,   -15,   -15,   -15,   -15,
     -15,    36,   151,    48,    48,   -15,    40,    64,   165,    36,
     167,   170,    -2,  -120,   -15,   176,   168,   171,    40,  -120,
    -120,  -120,    49,   174,    36,  -120,    -5,    40,   164,   166,
    -120,  -120,   175,   173,   177,   -15,  -120,  -120,    36,  -120,
    -120,   179,  -120
};

/* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
   Performed when YYTABLE does not specify something else to do.  Zero
   means the default is an error.  */
static const yytype_int8 yydefact[] =
{
       0,     0,     0,     0,     1,     0,     0,     0,     0,     0,
       0,     0,     0,     7,     0,     0,     0,     3,     0,     6,
       0,     0,     4,     5,     9,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     9,    23,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     9,     0,     8,
      40,    41,    42,     0,     0,    40,     0,     0,     0,     0,
       0,    47,     0,     0,     0,     0,    40,     0,    10,     0,
       2,    19,     0,     0,     0,     0,     0,     0,     0,    41,
       0,     0,    42,     0,    42,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    43,    44,    45,    46,    12,    13,    14,    15,    22,
      18,    16,    21,    17,    20,    52,    53,    50,    51,    48,
      49,     9,    38,    54,    55,    29,     0,     0,     0,     9,
       0,     0,     0,    35,    28,     0,     0,     0,     0,    39,
      36,    37,     0,     0,     9,    25,     0,     0,     0,     0,
      32,    31,     0,     0,     0,    30,    33,    34,     9,    27,
      26,     0,    24
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int8 yypgoto[] =
{
    -120,  -120,  -120,   -18,  -119,  -120,  -120,  -120,    37,  -120,
      58,   -38,   -39
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_uint8 yydefgoto[] =
{
       0,     2,    16,    68,    69,    36,    65,   143,    37,   133,
     122,    61,    62
};

/* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule whose
   number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_uint8 yytable[] =
{
      53,    56,   131,    92,    63,    99,    35,    67,   154,     1,
     137,     3,   121,    72,    73,    74,    75,     4,    49,    80,
      64,    83,    85,    54,    55,   153,    93,    94,    93,    94,
      31,    93,    94,     5,   101,   102,   103,   104,     6,   161,
      25,     8,    51,     7,    50,    66,    52,    26,   115,   116,
     117,   118,   119,   120,   123,   124,    27,   125,   127,    28,
      29,    30,    51,    51,    50,    50,    52,    52,    31,    11,
     147,    50,    17,    18,    32,    33,    34,   148,   149,    78,
     135,     9,    79,    51,    93,    94,    52,    82,   134,    51,
     150,   151,    10,    84,    72,    73,    74,    75,    12,   146,
      93,    94,    71,    19,    72,    73,    74,    75,    20,   155,
      86,    87,   109,    21,    72,    73,    74,    75,   112,    88,
      89,    13,    90,    91,    72,    73,    74,    75,   114,    22,
      72,    73,    74,    75,    14,    15,    23,    24,    39,    38,
      72,    73,    74,    75,    40,    41,    42,    43,    44,    45,
      46,    57,    58,    47,    59,    60,    81,    96,    98,    48,
      70,    76,    77,    97,   130,   100,     0,    95,   105,   140,
     106,   107,   108,   110,   111,   113,   121,   129,   136,   138,
     142,   126,   144,   128,   132,   139,   145,   152,   159,   158,
     141,     0,   156,   160,   162,   157
};

static const yytype_int16 yycheck[] =
{
      38,    39,   121,    13,     4,    13,    24,    46,    13,     5,
     129,     6,    14,    28,    29,    30,    31,     0,    36,    57,
      20,    59,    60,     3,     4,   144,    36,    37,    36,    37,
      32,    36,    37,     4,    72,    73,    74,    75,    14,   158,
       4,     7,    22,     5,     4,     4,    26,    11,    86,    87,
      88,    89,    90,    91,    93,    94,    20,    95,    97,    23,
      24,    25,    22,    22,     4,     4,    26,    26,    32,    12,
      21,     4,    17,    18,    38,    39,    40,    28,    29,    13,
      16,     8,    22,    22,    36,    37,    26,    26,   126,    22,
      41,    42,     9,    26,    28,    29,    30,    31,    10,   138,
      36,    37,    16,     4,    28,    29,    30,    31,    19,   147,
      34,    35,    16,    13,    28,    29,    30,    31,    16,    43,
      44,     4,    46,    47,    28,    29,    30,    31,    16,    19,
      28,    29,    30,    31,    17,    18,     4,    14,    12,    21,
      28,    29,    30,    31,     4,     4,     4,     4,    12,    12,
      12,    21,    21,    14,    21,    21,    27,     4,    45,    15,
      15,    13,    13,    16,    39,    15,    -1,    21,    16,   132,
      16,    16,    16,    16,    16,    16,    14,    14,    13,    12,
       4,    21,    14,    22,    33,    15,    15,    13,    15,    14,
     132,    -1,    28,    16,    15,    29
};

/* YYSTOS[STATE-NUM] -- The symbol kind of the accessing symbol of
   state STATE-NUM.  */
static const yytype_int8 yystos[] =
{
       0,     5,    49,     6,     0,     4,    14,     5,     7,     8,
       9,    12,    10,     4,    17,    18,    50,    17,    18,     4,
      19,    13,    19,     4,    14,     4,    11,    20,    23,    24,
      25,    32,    38,    39,    40,    51,    53,    56,    21,    12,
       4,     4,     4,     4,    12,    12,    12,    14,    15,    51,
       4,    22,    26,    59,     3,     4,    59,    21,    21,    21,
      21,    59,    60,     4,    20,    54,     4,    60,    51,    52,
      15,    16,    28,    29,    30,    31,    13,    13,    13,    22,
      59,    27,    26,    59,    26,    59,    34,    35,    43,    44,
      46,    47,    13,    36,    37,    21,     4,    16,    45,    13,
      15,    59,    59,    59,    59,    16,    16,    16,    16,    16,
      16,    16,    16,    16,    16,    59,    59,    59,    59,    59,
      59,    14,    58,    60,    60,    59,    21,    60,    22,    14,
      39,    52,    33,    57,    59,    16,    13,    52,    12,    15,
      56,    58,     4,    55,    14,    15,    60,    21,    28,    29,
      41,    42,    13,    52,    13,    59,    28,    29,    14,    15,
      16,    52,    15
};

/* YYR1[RULE-NUM] -- Symbol kind of the left-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr1[] =
{
       0,    48,    49,    50,    50,    50,    50,    50,    51,    51,
      52,    52,    53,    53,    53,    53,    53,    53,    53,    53,
      53,    53,    53,    53,    53,    53,    53,    53,    54,    54,
      55,    55,    55,    55,    55,    56,    57,    57,    57,    58,
      59,    59,    59,    59,    59,    59,    59,    60,    60,    60,
      60,    60,    60,    60,    60,    60
};

/* YYR2[RULE-NUM] -- Number of symbols on the right-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr2[] =
{
       0,     2,    16,     2,     3,     3,     2,     1,     2,     0,
       1,     0,     5,     5,     5,     5,     5,     5,     5,     4,
       5,     5,     5,     1,    11,     7,     9,     9,     4,     3,
       3,     2,     2,     3,     3,     6,     2,     2,     0,     3,
       1,     1,     1,     3,     3,     3,     3,     1,     3,     3,
       3,     3,     3,     3,     3,     3
};


enum { YYENOMEM = -2 };

#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab
#define YYNOMEM         goto yyexhaustedlab


#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                    \
  do                                                              \
    if (yychar == YYEMPTY)                                        \
      {                                                           \
        yychar = (Token);                                         \
        yylval = (Value);                                         \
        YYPOPSTACK (yylen);                                       \
        yystate = *yyssp;                                         \
        goto yybackup;                                            \
      }                                                           \
    else                                                          \
      {                                                           \
        yyerror (YY_("syntax error: cannot back up")); \
        YYERROR;                                                  \
      }                                                           \
  while (0)

/* Backward compatibility with an undocumented macro.
   Use YYerror or YYUNDEF. */
#define YYERRCODE YYUNDEF


/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)                        \
do {                                            \
  if (yydebug)                                  \
    YYFPRINTF Args;                             \
} while (0)




# define YY_SYMBOL_PRINT(Title, Kind, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Kind, Value); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*-----------------------------------.
| Print this symbol's value on YYO.  |
`-----------------------------------*/

static void
yy_symbol_value_print (FILE *yyo,
                       yysymbol_kind_t yykind, YYSTYPE const * const yyvaluep)
{
  FILE *yyoutput = yyo;
  YY_USE (yyoutput);
  if (!yyvaluep)
    return;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YY_USE (yykind);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/*---------------------------.
| Print this symbol on YYO.  |
`---------------------------*/

static void
yy_symbol_print (FILE *yyo,
                 yysymbol_kind_t yykind, YYSTYPE const * const yyvaluep)
{
  YYFPRINTF (yyo, "%s %s (",
             yykind < YYNTOKENS ? "token" : "nterm", yysymbol_name (yykind));

  yy_symbol_value_print (yyo, yykind, yyvaluep);
  YYFPRINTF (yyo, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

static void
yy_stack_print (yy_state_t *yybottom, yy_state_t *yytop)
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)                            \
do {                                                            \
  if (yydebug)                                                  \
    yy_stack_print ((Bottom), (Top));                           \
} while (0)


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

static void
yy_reduce_print (yy_state_t *yyssp, YYSTYPE *yyvsp,
                 int yyrule)
{
  int yylno = yyrline[yyrule];
  int yynrhs = yyr2[yyrule];
  int yyi;
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %d):\n",
             yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr,
                       YY_ACCESSING_SYMBOL (+yyssp[yyi + 1 - yynrhs]),
                       &yyvsp[(yyi + 1) - (yynrhs)]);
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)          \
do {                                    \
  if (yydebug)                          \
    yy_reduce_print (yyssp, yyvsp, Rule); \
} while (0)

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args) ((void) 0)
# define YY_SYMBOL_PRINT(Title, Kind, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif






/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
yydestruct (const char *yymsg,
            yysymbol_kind_t yykind, YYSTYPE *yyvaluep)
{
  YY_USE (yyvaluep);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yykind, yyvaluep, yylocationp);

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YY_USE (yykind);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/* Lookahead token kind.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;
/* Number of syntax errors so far.  */
int yynerrs;




/*----------.
| yyparse.  |
`----------*/

int
yyparse (void)
{
    yy_state_fast_t yystate = 0;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus = 0;

    /* Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* Their size.  */
    YYPTRDIFF_T yystacksize = YYINITDEPTH;

    /* The state stack: array, bottom, top.  */
    yy_state_t yyssa[YYINITDEPTH];
    yy_state_t *yyss = yyssa;
    yy_state_t *yyssp = yyss;

    /* The semantic value stack: array, bottom, top.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs = yyvsa;
    YYSTYPE *yyvsp = yyvs;

  int yyn;
  /* The return value of yyparse.  */
  int yyresult;
  /* Lookahead symbol kind.  */
  yysymbol_kind_t yytoken = YYSYMBOL_YYEMPTY;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;



#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yychar = YYEMPTY; /* Cause a token to be read.  */

  goto yysetstate;


/*------------------------------------------------------------.
| yynewstate -- push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;


/*--------------------------------------------------------------------.
| yysetstate -- set current state (the top of the stack) to yystate.  |
`--------------------------------------------------------------------*/
yysetstate:
  YYDPRINTF ((stderr, "Entering state %d\n", yystate));
  YY_ASSERT (0 <= yystate && yystate < YYNSTATES);
  YY_IGNORE_USELESS_CAST_BEGIN
  *yyssp = YY_CAST (yy_state_t, yystate);
  YY_IGNORE_USELESS_CAST_END
  YY_STACK_PRINT (yyss, yyssp);

  if (yyss + yystacksize - 1 <= yyssp)
#if !defined yyoverflow && !defined YYSTACK_RELOCATE
    YYNOMEM;
#else
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYPTRDIFF_T yysize = yyssp - yyss + 1;

# if defined yyoverflow
      {
        /* Give user a chance to reallocate the stack.  Use copies of
           these so that the &'s don't force the real ones into
           memory.  */
        yy_state_t *yyss1 = yyss;
        YYSTYPE *yyvs1 = yyvs;

        /* Each stack pointer address is followed by the size of the
           data in use in that stack, in bytes.  This used to be a
           conditional around just the two extra args, but that might
           be undefined if yyoverflow is a macro.  */
        yyoverflow (YY_("memory exhausted"),
                    &yyss1, yysize * YYSIZEOF (*yyssp),
                    &yyvs1, yysize * YYSIZEOF (*yyvsp),
                    &yystacksize);
        yyss = yyss1;
        yyvs = yyvs1;
      }
# else /* defined YYSTACK_RELOCATE */
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
        YYNOMEM;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
        yystacksize = YYMAXDEPTH;

      {
        yy_state_t *yyss1 = yyss;
        union yyalloc *yyptr =
          YY_CAST (union yyalloc *,
                   YYSTACK_ALLOC (YY_CAST (YYSIZE_T, YYSTACK_BYTES (yystacksize))));
        if (! yyptr)
          YYNOMEM;
        YYSTACK_RELOCATE (yyss_alloc, yyss);
        YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
        if (yyss1 != yyssa)
          YYSTACK_FREE (yyss1);
      }
# endif

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YY_IGNORE_USELESS_CAST_BEGIN
      YYDPRINTF ((stderr, "Stack size increased to %ld\n",
                  YY_CAST (long, yystacksize)));
      YY_IGNORE_USELESS_CAST_END

      if (yyss + yystacksize - 1 <= yyssp)
        YYABORT;
    }
#endif /* !defined yyoverflow && !defined YYSTACK_RELOCATE */


  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;


/*-----------.
| yybackup.  |
`-----------*/
yybackup:
  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either empty, or end-of-input, or a valid lookahead.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token\n"));
      yychar = yylex ();
    }

  if (yychar <= YYEOF)
    {
      yychar = YYEOF;
      yytoken = YYSYMBOL_YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else if (yychar == YYerror)
    {
      /* The scanner already issued an error message, process directly
         to error recovery.  But do not keep the error token as
         lookahead, it is too special and may lead us to an endless
         loop in error recovery. */
      yychar = YYUNDEF;
      yytoken = YYSYMBOL_YYerror;
      goto yyerrlab1;
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);
  yystate = yyn;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

  /* Discard the shifted token.  */
  yychar = YYEMPTY;
  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     '$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
  case 2: /* program: PUBLIC CLASS ID LBRACE PUBLIC STATIC VOID MAIN LPAREN STRING array_param RPAREN LBRACE statements RBRACE RBRACE  */
#line 43 "parser.y"
                                                                                                                    {
        printf("#include <iostream>\nusing namespace std;\nint main() {\n%s    return 0;\n}\n", (yyvsp[-2].str));
    }
#line 1229 "parser.tab.c"
    break;

  case 3: /* array_param: ID ARR  */
#line 49 "parser.y"
           { (yyval.str) = (yyvsp[-1].str); }
#line 1235 "parser.tab.c"
    break;

  case 4: /* array_param: ID LSQUARE RSQUARE  */
#line 50 "parser.y"
                         { (yyval.str) = (yyvsp[-2].str); }
#line 1241 "parser.tab.c"
    break;

  case 5: /* array_param: LSQUARE RSQUARE ID  */
#line 51 "parser.y"
                         { (yyval.str) = (yyvsp[0].str); }
#line 1247 "parser.tab.c"
    break;

  case 6: /* array_param: ARR ID  */
#line 52 "parser.y"
             { (yyval.str) = (yyvsp[0].str); }
#line 1253 "parser.tab.c"
    break;

  case 7: /* array_param: ID  */
#line 53 "parser.y"
                                            { (yyval.str) = (yyvsp[0].str); }
#line 1259 "parser.tab.c"
    break;

  case 8: /* statements: statement statements  */
#line 57 "parser.y"
                         {
        size_t len = strlen((yyvsp[-1].str)) + strlen((yyvsp[0].str)) + 1;
        char *tmp = (char*)malloc(len);
        strcpy(tmp, (yyvsp[-1].str));
        strcat(tmp, (yyvsp[0].str));
        (yyval.str) = tmp;
        free((yyvsp[-1].str));
        free((yyvsp[0].str));
    }
#line 1273 "parser.tab.c"
    break;

  case 9: /* statements: %empty  */
#line 66 "parser.y"
                  { (yyval.str) = strdup(""); }
#line 1279 "parser.tab.c"
    break;

  case 10: /* statements_or_empty: statements  */
#line 70 "parser.y"
               { (yyval.str) = (yyvsp[0].str); }
#line 1285 "parser.tab.c"
    break;

  case 11: /* statements_or_empty: %empty  */
#line 71 "parser.y"
                  { (yyval.str) = strdup(""); }
#line 1291 "parser.tab.c"
    break;

  case 12: /* statement: PRINT LPAREN STRLIT RPAREN SEMICOLON  */
#line 75 "parser.y"
                                         {
        size_t len = strlen((yyvsp[-2].str)) + 30;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    cout << %s << endl;\n", (yyvsp[-2].str));
        (yyval.str) = out;
        free((yyvsp[-2].str));
    }
#line 1303 "parser.tab.c"
    break;

  case 13: /* statement: PRINT LPAREN ID RPAREN SEMICOLON  */
#line 82 "parser.y"
                                       {
        size_t len = strlen((yyvsp[-2].str)) + 30;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    cout << %s << endl;\n", (yyvsp[-2].str));
        (yyval.str) = out;
        free((yyvsp[-2].str));
    }
#line 1315 "parser.tab.c"
    break;

  case 14: /* statement: PRINT LPAREN expr RPAREN SEMICOLON  */
#line 89 "parser.y"
                                         {
        size_t len = strlen((yyvsp[-2].str)) + 30;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    cout << %s << endl;\n", (yyvsp[-2].str));
        (yyval.str) = out;
        free((yyvsp[-2].str));
    }
#line 1327 "parser.tab.c"
    break;

  case 15: /* statement: INT ID ASSIGN NUMBER SEMICOLON  */
#line 96 "parser.y"
                                     {
        size_t len = strlen((yyvsp[-3].str)) + 30;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    int %s = %s;\n", (yyvsp[-3].str), (yyvsp[-1].str));
        (yyval.str) = out;
        free((yyvsp[-3].str));
        free((yyvsp[-1].str));
    }
#line 1340 "parser.tab.c"
    break;

  case 16: /* statement: FLOAT ID ASSIGN FLOATNUM SEMICOLON  */
#line 104 "parser.y"
                                         {
        size_t len = strlen((yyvsp[-3].str)) + 30;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    float %s = %s;\n", (yyvsp[-3].str), (yyvsp[-1].str));
        (yyval.str) = out;
        free((yyvsp[-3].str));
        free((yyvsp[-1].str));
    }
#line 1353 "parser.tab.c"
    break;

  case 17: /* statement: DOUBLE ID ASSIGN FLOATNUM SEMICOLON  */
#line 112 "parser.y"
                                          {
        size_t len = strlen((yyvsp[-3].str)) + 30;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    double %s = %s;\n", (yyvsp[-3].str), (yyvsp[-1].str));
        (yyval.str) = out;
        free((yyvsp[-3].str));
        free((yyvsp[-1].str));
    }
#line 1366 "parser.tab.c"
    break;

  case 18: /* statement: CHAR ID ASSIGN CHARLIT SEMICOLON  */
#line 120 "parser.y"
                                       {
        size_t len = strlen((yyvsp[-3].str)) + 30;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    char %s = %s;\n", (yyvsp[-3].str), (yyvsp[-1].str));
        (yyval.str) = out;
        free((yyvsp[-3].str));
        free((yyvsp[-1].str));
    }
#line 1379 "parser.tab.c"
    break;

  case 19: /* statement: ID ASSIGN expr SEMICOLON  */
#line 128 "parser.y"
                               {
        size_t len = strlen((yyvsp[-3].str)) + strlen((yyvsp[-1].str)) + 10;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    %s = %s;\n", (yyvsp[-3].str), (yyvsp[-1].str));
        (yyval.str) = out;
        free((yyvsp[-3].str));
        free((yyvsp[-1].str));
    }
#line 1392 "parser.tab.c"
    break;

  case 20: /* statement: DOUBLE ID ASSIGN expr SEMICOLON  */
#line 136 "parser.y"
                                      {
        size_t len = strlen((yyvsp[-3].str)) + strlen((yyvsp[-1].str)) + 30;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    double %s = %s;\n", (yyvsp[-3].str), (yyvsp[-1].str));
        (yyval.str) = out;
        free((yyvsp[-3].str));
        free((yyvsp[-1].str));
    }
#line 1405 "parser.tab.c"
    break;

  case 21: /* statement: FLOAT ID ASSIGN expr SEMICOLON  */
#line 144 "parser.y"
                                     {
        size_t len = strlen((yyvsp[-3].str)) + strlen((yyvsp[-1].str)) + 30;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    float %s = %s;\n", (yyvsp[-3].str), (yyvsp[-1].str));
        (yyval.str) = out;
        free((yyvsp[-3].str));
        free((yyvsp[-1].str));
    }
#line 1418 "parser.tab.c"
    break;

  case 22: /* statement: INT ID ASSIGN expr SEMICOLON  */
#line 152 "parser.y"
                                   {
        size_t len = strlen((yyvsp[-3].str)) + strlen((yyvsp[-1].str)) + 30;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    int %s = %s;\n", (yyvsp[-3].str), (yyvsp[-1].str));
        (yyval.str) = out;
        free((yyvsp[-3].str));
        free((yyvsp[-1].str));
    }
#line 1431 "parser.tab.c"
    break;

  case 23: /* statement: if_stmt  */
#line 160 "parser.y"
              { (yyval.str) = (yyvsp[0].str); }
#line 1437 "parser.tab.c"
    break;

  case 24: /* statement: FOR LPAREN for_init SEMICOLON cond SEMICOLON for_incr RPAREN LBRACE statements_or_empty RBRACE  */
#line 161 "parser.y"
                                                                                                     {
        size_t len = strlen((yyvsp[-8].str)) + strlen((yyvsp[-6].str)) + strlen((yyvsp[-4].str)) + strlen((yyvsp[-1].str)) + 100;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    for (%s; %s; %s) {\n%s    }\n", (yyvsp[-8].str), (yyvsp[-6].str), (yyvsp[-4].str), (yyvsp[-1].str));
        (yyval.str) = out;
        free((yyvsp[-8].str)); free((yyvsp[-6].str)); free((yyvsp[-4].str)); free((yyvsp[-1].str));
    }
#line 1449 "parser.tab.c"
    break;

  case 25: /* statement: WHILE LPAREN cond RPAREN LBRACE statements_or_empty RBRACE  */
#line 168 "parser.y"
                                                                 {
        size_t len = strlen((yyvsp[-4].str)) + strlen((yyvsp[-1].str)) + 40;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    while (%s) {\n%s    }\n", (yyvsp[-4].str), (yyvsp[-1].str));
        (yyval.str) = out;
        free((yyvsp[-4].str)); free((yyvsp[-1].str));
    }
#line 1461 "parser.tab.c"
    break;

  case 26: /* statement: DO LBRACE statements_or_empty RBRACE WHILE LPAREN cond RPAREN SEMICOLON  */
#line 175 "parser.y"
                                                                              {
        size_t len = strlen((yyvsp[-6].str)) + strlen((yyvsp[-2].str)) + 50;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    do {\n%s    } while (%s);\n", (yyvsp[-6].str), (yyvsp[-2].str));
        (yyval.str) = out;
        free((yyvsp[-6].str)); free((yyvsp[-2].str));
    }
#line 1473 "parser.tab.c"
    break;

  case 27: /* statement: WHILE LPAREN ID LT NUMBER RPAREN LBRACE statements_or_empty RBRACE  */
#line 182 "parser.y"
                                                                         {
        size_t len = strlen((yyvsp[-6].str)) + strlen((yyvsp[-4].str)) + strlen((yyvsp[-1].str)) + 40;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    while (%s < %s) {\n%s    }\n", (yyvsp[-6].str), (yyvsp[-4].str), (yyvsp[-1].str));
        (yyval.str) = out;
        free((yyvsp[-6].str)); free((yyvsp[-4].str)); free((yyvsp[-1].str));
    }
#line 1485 "parser.tab.c"
    break;

  case 28: /* for_init: INT ID ASSIGN expr  */
#line 192 "parser.y"
                       { 
        size_t len = strlen((yyvsp[-2].str)) + strlen((yyvsp[0].str)) + 10;
        char *out = (char*)malloc(len);
        snprintf(out, len, "int %s = %s", (yyvsp[-2].str), (yyvsp[0].str));
        (yyval.str) = out;
        free((yyvsp[-2].str)); free((yyvsp[0].str));
    }
#line 1497 "parser.tab.c"
    break;

  case 29: /* for_init: ID ASSIGN expr  */
#line 199 "parser.y"
                     {
        size_t len = strlen((yyvsp[-2].str)) + strlen((yyvsp[0].str)) + 5;
        char *out = (char*)malloc(len);
        snprintf(out, len, "%s = %s", (yyvsp[-2].str), (yyvsp[0].str));
        (yyval.str) = out;
        free((yyvsp[-2].str)); free((yyvsp[0].str));
    }
#line 1509 "parser.tab.c"
    break;

  case 30: /* for_incr: ID ASSIGN expr  */
#line 209 "parser.y"
                   {
        size_t len = strlen((yyvsp[-2].str)) + strlen((yyvsp[0].str)) + 5;
        char *out = (char*)malloc(len);
        snprintf(out, len, "%s = %s", (yyvsp[-2].str), (yyvsp[0].str));
        (yyval.str) = out;
        free((yyvsp[-2].str)); free((yyvsp[0].str));
    }
#line 1521 "parser.tab.c"
    break;

  case 31: /* for_incr: ID PLUSPLUS  */
#line 216 "parser.y"
                  {
        size_t len = strlen((yyvsp[-1].str)) + 3;
        char *out = (char*)malloc(len);
        snprintf(out, len, "%s++", (yyvsp[-1].str));
        (yyval.str) = out;
        free((yyvsp[-1].str));
    }
#line 1533 "parser.tab.c"
    break;

  case 32: /* for_incr: ID MINUSMINUS  */
#line 223 "parser.y"
                    {
        size_t len = strlen((yyvsp[-1].str)) + 3;
        char *out = (char*)malloc(len);
        snprintf(out, len, "%s--", (yyvsp[-1].str));
        (yyval.str) = out;
        free((yyvsp[-1].str));
    }
#line 1545 "parser.tab.c"
    break;

  case 33: /* for_incr: ID PLUS PLUS  */
#line 230 "parser.y"
                   {
        size_t len = strlen((yyvsp[-2].str)) + 3;
        char *out = (char*)malloc(len);
        snprintf(out, len, "%s++", (yyvsp[-2].str));
        (yyval.str) = out;
        free((yyvsp[-2].str));
    }
#line 1557 "parser.tab.c"
    break;

  case 34: /* for_incr: ID MINUS MINUS  */
#line 237 "parser.y"
                     {
        size_t len = strlen((yyvsp[-2].str)) + 3;
        char *out = (char*)malloc(len);
        snprintf(out, len, "%s--", (yyvsp[-2].str));
        (yyval.str) = out;
        free((yyvsp[-2].str));
    }
#line 1569 "parser.tab.c"
    break;

  case 35: /* if_stmt: IF LPAREN cond RPAREN block else_part  */
#line 248 "parser.y"
                                          {
        size_t len = strlen((yyvsp[-3].str)) + strlen((yyvsp[-1].str)) + strlen((yyvsp[0].str)) + 40;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    if (%s) %s%s", (yyvsp[-3].str), (yyvsp[-1].str), (yyvsp[0].str));
        (yyval.str) = out;
        free((yyvsp[-3].str)); free((yyvsp[-1].str)); free((yyvsp[0].str));
    }
#line 1581 "parser.tab.c"
    break;

  case 36: /* else_part: ELSE if_stmt  */
#line 258 "parser.y"
                 {
        size_t len = strlen((yyvsp[0].str)) + 10;
        char *out = (char*)malloc(len);
        snprintf(out, len, "else %s", (yyvsp[0].str));
        (yyval.str) = out;
        free((yyvsp[0].str));
    }
#line 1593 "parser.tab.c"
    break;

  case 37: /* else_part: ELSE block  */
#line 265 "parser.y"
                 {
        size_t len = strlen((yyvsp[0].str)) + 10;
        char *out = (char*)malloc(len);
        snprintf(out, len, "else %s", (yyvsp[0].str));
        (yyval.str) = out;
        free((yyvsp[0].str));
    }
#line 1605 "parser.tab.c"
    break;

  case 38: /* else_part: %empty  */
#line 272 "parser.y"
                  { (yyval.str) = strdup(""); }
#line 1611 "parser.tab.c"
    break;

  case 39: /* block: LBRACE statements_or_empty RBRACE  */
#line 276 "parser.y"
                                      {
        size_t len = strlen((yyvsp[-1].str)) + 10;
        char *out = (char*)malloc(len);
        snprintf(out, len, "{\n%s    }\n", (yyvsp[-1].str));
        (yyval.str) = out;
        free((yyvsp[-1].str));
    }
#line 1623 "parser.tab.c"
    break;

  case 40: /* expr: ID  */
#line 286 "parser.y"
       { (yyval.str) = strdup((yyvsp[0].str)); free((yyvsp[0].str)); }
#line 1629 "parser.tab.c"
    break;

  case 41: /* expr: NUMBER  */
#line 287 "parser.y"
             { (yyval.str) = strdup((yyvsp[0].str)); free((yyvsp[0].str)); }
#line 1635 "parser.tab.c"
    break;

  case 42: /* expr: FLOATNUM  */
#line 288 "parser.y"
               { (yyval.str) = strdup((yyvsp[0].str)); free((yyvsp[0].str)); }
#line 1641 "parser.tab.c"
    break;

  case 43: /* expr: expr PLUS expr  */
#line 289 "parser.y"
                     {
        size_t len = strlen((yyvsp[-2].str)) + strlen((yyvsp[0].str)) + 4;
        char *tmp = (char*)malloc(len);
        snprintf(tmp, len, "%s + %s", (yyvsp[-2].str), (yyvsp[0].str));
        (yyval.str) = tmp;
        free((yyvsp[-2].str)); free((yyvsp[0].str));
    }
#line 1653 "parser.tab.c"
    break;

  case 44: /* expr: expr MINUS expr  */
#line 296 "parser.y"
                      {
        size_t len = strlen((yyvsp[-2].str)) + strlen((yyvsp[0].str)) + 4;
        char *tmp = (char*)malloc(len);
        snprintf(tmp, len, "%s - %s", (yyvsp[-2].str), (yyvsp[0].str));
        (yyval.str) = tmp;
        free((yyvsp[-2].str)); free((yyvsp[0].str));
    }
#line 1665 "parser.tab.c"
    break;

  case 45: /* expr: expr TIMES expr  */
#line 303 "parser.y"
                      {
        size_t len = strlen((yyvsp[-2].str)) + strlen((yyvsp[0].str)) + 4;
        char *tmp = (char*)malloc(len);
        snprintf(tmp, len, "%s * %s", (yyvsp[-2].str), (yyvsp[0].str));
        (yyval.str) = tmp;
        free((yyvsp[-2].str)); free((yyvsp[0].str));
    }
#line 1677 "parser.tab.c"
    break;

  case 46: /* expr: expr DIVIDE expr  */
#line 310 "parser.y"
                       {
        size_t len = strlen((yyvsp[-2].str)) + strlen((yyvsp[0].str)) + 4;
        char *tmp = (char*)malloc(len);
        snprintf(tmp, len, "%s / %s", (yyvsp[-2].str), (yyvsp[0].str));
        (yyval.str) = tmp;
        free((yyvsp[-2].str)); free((yyvsp[0].str));
    }
#line 1689 "parser.tab.c"
    break;

  case 47: /* cond: expr  */
#line 320 "parser.y"
         { (yyval.str) = strdup((yyvsp[0].str)); free((yyvsp[0].str)); }
#line 1695 "parser.tab.c"
    break;

  case 48: /* cond: expr '>' expr  */
#line 321 "parser.y"
                    {
        size_t len = strlen((yyvsp[-2].str)) + strlen((yyvsp[0].str)) + 4;
        char *tmp = (char*)malloc(len);
        snprintf(tmp, len, "%s > %s", (yyvsp[-2].str), (yyvsp[0].str));
        (yyval.str) = tmp;
        free((yyvsp[-2].str)); free((yyvsp[0].str));
    }
#line 1707 "parser.tab.c"
    break;

  case 49: /* cond: expr '<' expr  */
#line 328 "parser.y"
                    {
        size_t len = strlen((yyvsp[-2].str)) + strlen((yyvsp[0].str)) + 4;
        char *tmp = (char*)malloc(len);
        snprintf(tmp, len, "%s < %s", (yyvsp[-2].str), (yyvsp[0].str));
        (yyval.str) = tmp;
        free((yyvsp[-2].str)); free((yyvsp[0].str));
    }
#line 1719 "parser.tab.c"
    break;

  case 50: /* cond: expr LE expr  */
#line 335 "parser.y"
                   {
        size_t len = strlen((yyvsp[-2].str)) + strlen((yyvsp[0].str)) + 5;
        char *tmp = (char*)malloc(len);
        snprintf(tmp, len, "%s <= %s", (yyvsp[-2].str), (yyvsp[0].str));
        (yyval.str) = tmp;
        free((yyvsp[-2].str)); free((yyvsp[0].str));
    }
#line 1731 "parser.tab.c"
    break;

  case 51: /* cond: expr GE expr  */
#line 342 "parser.y"
                   {
        size_t len = strlen((yyvsp[-2].str)) + strlen((yyvsp[0].str)) + 5;
        char *tmp = (char*)malloc(len);
        snprintf(tmp, len, "%s >= %s", (yyvsp[-2].str), (yyvsp[0].str));
        (yyval.str) = tmp;
        free((yyvsp[-2].str)); free((yyvsp[0].str));
    }
#line 1743 "parser.tab.c"
    break;

  case 52: /* cond: expr EQ expr  */
#line 349 "parser.y"
                   {
        size_t len = strlen((yyvsp[-2].str)) + strlen((yyvsp[0].str)) + 5;
        char *tmp = (char*)malloc(len);
        snprintf(tmp, len, "%s == %s", (yyvsp[-2].str), (yyvsp[0].str));
        (yyval.str) = tmp;
        free((yyvsp[-2].str)); free((yyvsp[0].str));
    }
#line 1755 "parser.tab.c"
    break;

  case 53: /* cond: expr NEQ expr  */
#line 356 "parser.y"
                    {
        size_t len = strlen((yyvsp[-2].str)) + strlen((yyvsp[0].str)) + 5;
        char *tmp = (char*)malloc(len);
        snprintf(tmp, len, "%s != %s", (yyvsp[-2].str), (yyvsp[0].str));
        (yyval.str) = tmp;
        free((yyvsp[-2].str)); free((yyvsp[0].str));
    }
#line 1767 "parser.tab.c"
    break;

  case 54: /* cond: cond AND cond  */
#line 363 "parser.y"
                    {
        size_t len = strlen((yyvsp[-2].str)) + strlen((yyvsp[0].str)) + 6;
        char *tmp = (char*)malloc(len);
        snprintf(tmp, len, "%s && %s", (yyvsp[-2].str), (yyvsp[0].str));
        (yyval.str) = tmp;
        free((yyvsp[-2].str)); free((yyvsp[0].str));
    }
#line 1779 "parser.tab.c"
    break;

  case 55: /* cond: cond OR cond  */
#line 370 "parser.y"
                   {
        size_t len = strlen((yyvsp[-2].str)) + strlen((yyvsp[0].str)) + 6;
        char *tmp = (char*)malloc(len);
        snprintf(tmp, len, "%s || %s", (yyvsp[-2].str), (yyvsp[0].str));
        (yyval.str) = tmp;
        free((yyvsp[-2].str)); free((yyvsp[0].str));
    }
#line 1791 "parser.tab.c"
    break;


#line 1795 "parser.tab.c"

      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", YY_CAST (yysymbol_kind_t, yyr1[yyn]), &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;

  *++yyvsp = yyval;

  /* Now 'shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */
  {
    const int yylhs = yyr1[yyn] - YYNTOKENS;
    const int yyi = yypgoto[yylhs] + *yyssp;
    yystate = (0 <= yyi && yyi <= YYLAST && yycheck[yyi] == *yyssp
               ? yytable[yyi]
               : yydefgoto[yylhs]);
  }

  goto yynewstate;


/*--------------------------------------.
| yyerrlab -- here on detecting error.  |
`--------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYSYMBOL_YYEMPTY : YYTRANSLATE (yychar);
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
      yyerror (YY_("syntax error"));
    }

  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
         error, discard it.  */

      if (yychar <= YYEOF)
        {
          /* Return failure if at end of input.  */
          if (yychar == YYEOF)
            YYABORT;
        }
      else
        {
          yydestruct ("Error: discarding",
                      yytoken, &yylval);
          yychar = YYEMPTY;
        }
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:
  /* Pacify compilers when the user code never invokes YYERROR and the
     label yyerrorlab therefore never appears in user code.  */
  if (0)
    YYERROR;
  ++yynerrs;

  /* Do not reclaim the symbols of the rule whose action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;      /* Each real token shifted decrements this.  */

  /* Pop stack until we find a state that shifts the error token.  */
  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
        {
          yyn += YYSYMBOL_YYerror;
          if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYSYMBOL_YYerror)
            {
              yyn = yytable[yyn];
              if (0 < yyn)
                break;
            }
        }

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
        YYABORT;


      yydestruct ("Error: popping",
                  YY_ACCESSING_SYMBOL (yystate), yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", YY_ACCESSING_SYMBOL (yyn), yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturnlab;


/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturnlab;


/*-----------------------------------------------------------.
| yyexhaustedlab -- YYNOMEM (memory exhaustion) comes here.  |
`-----------------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  goto yyreturnlab;


/*----------------------------------------------------------.
| yyreturnlab -- parsing is finished, clean up and return.  |
`----------------------------------------------------------*/
yyreturnlab:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval);
    }
  /* Do not reclaim the symbols of the rule whose action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
                  YY_ACCESSING_SYMBOL (+*yyssp), yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif

  return yyresult;
}

#line 380 "parser.y"



int main() {
    yyparse();
    return 0;
}
