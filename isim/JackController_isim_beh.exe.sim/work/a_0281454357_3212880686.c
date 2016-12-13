/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0xfbc00daa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/nabav/Workspace/HexapodTestBench/Debounce.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_3620187407;

unsigned char ieee_p_2592010699_sub_2763492388968962707_503743352(char *, char *, unsigned int , unsigned int );
unsigned char ieee_p_3620187407_sub_970019341842465249_3965413181(char *, char *, char *, int );


static void work_a_0281454357_3212880686_p_0(char *t0)
{
    char t16[16];
    char t17[16];
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    unsigned char t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    int t11;
    int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t18;

LAB0:    xsi_set_current_line(22, ng0);
    t1 = (t0 + 992U);
    t2 = ieee_p_2592010699_sub_2763492388968962707_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 3064);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(23, ng0);
    t3 = (t0 + 1768U);
    t4 = *((char **)t3);
    t3 = (t0 + 4888U);
    t5 = ieee_p_3620187407_sub_970019341842465249_3965413181(IEEE_P_3620187407, t4, t3, 0);
    if (t5 != 0)
        goto LAB5;

LAB7:    t1 = (t0 + 1768U);
    t3 = *((char **)t1);
    t1 = (t0 + 4888U);
    t11 = xsi_vhdl_pow(2, 4);
    t12 = (t11 - 1);
    t2 = ieee_p_3620187407_sub_970019341842465249_3965413181(IEEE_P_3620187407, t3, t1, t12);
    if (t2 != 0)
        goto LAB8;

LAB9:
LAB6:    xsi_set_current_line(28, ng0);
    t1 = (t0 + 1768U);
    t3 = *((char **)t1);
    t11 = (4 - 2);
    t13 = (3 - t11);
    t14 = (t13 * 1U);
    t15 = (0 + t14);
    t1 = (t3 + t15);
    t4 = (t0 + 1192U);
    t6 = *((char **)t4);
    t2 = *((unsigned char *)t6);
    t7 = ((IEEE_P_2592010699) + 4000);
    t8 = (t17 + 0U);
    t9 = (t8 + 0U);
    *((int *)t9) = 2;
    t9 = (t8 + 4U);
    *((int *)t9) = 0;
    t9 = (t8 + 8U);
    *((int *)t9) = -1;
    t12 = (0 - 2);
    t18 = (t12 * -1);
    t18 = (t18 + 1);
    t9 = (t8 + 12U);
    *((unsigned int *)t9) = t18;
    t4 = xsi_base_array_concat(t4, t16, t7, (char)97, t1, t17, (char)99, t2, (char)101);
    t9 = (t0 + 1768U);
    t10 = *((char **)t9);
    t9 = (t10 + 0);
    t18 = (3U + 1U);
    memcpy(t9, t4, t18);
    goto LAB3;

LAB5:    xsi_set_current_line(24, ng0);
    t6 = (t0 + 3144);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    *((unsigned char *)t10) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t6);
    goto LAB6;

LAB8:    xsi_set_current_line(26, ng0);
    t4 = (t0 + 3144);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t4);
    goto LAB6;

}


extern void work_a_0281454357_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0281454357_3212880686_p_0};
	xsi_register_didat("work_a_0281454357_3212880686", "isim/JackController_isim_beh.exe.sim/work/a_0281454357_3212880686.didat");
	xsi_register_executes(pe);
}
