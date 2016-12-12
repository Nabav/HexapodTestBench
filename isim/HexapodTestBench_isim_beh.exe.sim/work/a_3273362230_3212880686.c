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
static const char *ng0 = "/home/nabav/Workspace/HexapodTestBench/Frame_Transmitter.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_3620187407;

unsigned char ieee_p_2592010699_sub_2763492388968962707_503743352(char *, char *, unsigned int , unsigned int );
unsigned char ieee_p_2592010699_sub_374109322130769762_503743352(char *, unsigned char );
char *ieee_p_3620187407_sub_1496620905533649268_3965413181(char *, char *, char *, char *, char *, char *);
char *ieee_p_3620187407_sub_1496620905533721142_3965413181(char *, char *, char *, char *, char *, char *);


static void work_a_3273362230_3212880686_p_0(char *t0)
{
    char t17[16];
    char t18[16];
    char t21[16];
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    int t5;
    char *t6;
    int t7;
    int t8;
    unsigned char t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    unsigned char t14;
    unsigned char t15;
    unsigned char t16;
    unsigned int t19;
    char *t20;
    char *t22;
    char *t23;
    unsigned int t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;
    unsigned int t30;
    int t31;
    static char *nl0[] = {&&LAB9, &&LAB10, &&LAB11, &&LAB12, &&LAB13, &&LAB14, &&LAB15};

LAB0:    xsi_set_current_line(34, ng0);
    t1 = (t0 + 992U);
    t2 = ieee_p_2592010699_sub_2763492388968962707_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 5560);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(35, ng0);
    t3 = (t0 + 2312U);
    t4 = *((char **)t3);
    t5 = *((int *)t4);
    t3 = (t0 + 3648U);
    t6 = *((char **)t3);
    t7 = *((int *)t6);
    t8 = (t7 - 1);
    t9 = (t5 >= t8);
    if (t9 != 0)
        goto LAB5;

LAB7:    xsi_set_current_line(38, ng0);
    t1 = (t0 + 2312U);
    t3 = *((char **)t1);
    t5 = *((int *)t3);
    t7 = (t5 + 1);
    t1 = (t0 + 5672);
    t4 = (t1 + 56U);
    t6 = *((char **)t4);
    t10 = (t6 + 56U);
    t11 = *((char **)t10);
    *((int *)t11) = t7;
    xsi_driver_first_trans_fast(t1);

LAB6:    xsi_set_current_line(40, ng0);
    t1 = (t0 + 2792U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t1 = (char *)((nl0) + t2);
    goto **((char **)t1);

LAB5:    xsi_set_current_line(36, ng0);
    t3 = (t0 + 5672);
    t10 = (t3 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    *((int *)t13) = 0;
    xsi_driver_first_trans_fast(t3);
    goto LAB6;

LAB8:    xsi_set_current_line(88, ng0);
    t1 = (t0 + 1352U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t1 = (t0 + 3768U);
    t4 = *((char **)t1);
    t1 = (t4 + 0);
    *((unsigned char *)t1) = t2;
    goto LAB3;

LAB9:    xsi_set_current_line(42, ng0);
    t4 = (t0 + 5736);
    t6 = (t4 + 56U);
    t10 = *((char **)t6);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t4);
    xsi_set_current_line(43, ng0);
    t1 = (t0 + 5800);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t6 = (t4 + 56U);
    t10 = *((char **)t6);
    *((unsigned char *)t10) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(44, ng0);
    t1 = (t0 + 5864);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t6 = (t4 + 56U);
    t10 = *((char **)t6);
    *((int *)t10) = 39;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(45, ng0);
    t1 = (t0 + 5928);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t6 = (t4 + 56U);
    t10 = *((char **)t6);
    *((int *)t10) = 0;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(46, ng0);
    t1 = (t0 + 3768U);
    t3 = *((char **)t1);
    t9 = *((unsigned char *)t3);
    t14 = (t9 == (unsigned char)2);
    if (t14 == 1)
        goto LAB19;

LAB20:    t2 = (unsigned char)0;

LAB21:    if (t2 != 0)
        goto LAB16;

LAB18:
LAB17:    goto LAB8;

LAB10:    xsi_set_current_line(50, ng0);
    t1 = (t0 + 5992);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t6 = (t4 + 56U);
    t10 = *((char **)t6);
    *((unsigned char *)t10) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(51, ng0);
    t1 = (t0 + 5800);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t6 = (t4 + 56U);
    t10 = *((char **)t6);
    *((unsigned char *)t10) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(52, ng0);
    t1 = (t0 + 9957);
    t4 = (t0 + 1512U);
    t6 = *((char **)t4);
    t10 = ((IEEE_P_2592010699) + 4000);
    t11 = (t18 + 0U);
    t12 = (t11 + 0U);
    *((int *)t12) = 0;
    t12 = (t11 + 4U);
    *((int *)t12) = 2;
    t12 = (t11 + 8U);
    *((int *)t12) = 1;
    t5 = (2 - 0);
    t19 = (t5 * 1);
    t19 = (t19 + 1);
    t12 = (t11 + 12U);
    *((unsigned int *)t12) = t19;
    t12 = (t0 + 9696U);
    t4 = xsi_base_array_concat(t4, t17, t10, (char)97, t1, t18, (char)97, t6, t12, (char)101);
    t13 = (t0 + 1672U);
    t20 = *((char **)t13);
    t22 = ((IEEE_P_2592010699) + 4000);
    t23 = (t0 + 9712U);
    t13 = xsi_base_array_concat(t13, t21, t22, (char)97, t4, t17, (char)97, t20, t23, (char)101);
    t19 = (3U + 2U);
    t24 = (t19 + 3U);
    t2 = (8U != t24);
    if (t2 == 1)
        goto LAB22;

LAB23:    t25 = (t0 + 6056);
    t26 = (t25 + 56U);
    t27 = *((char **)t26);
    t28 = (t27 + 56U);
    t29 = *((char **)t28);
    memcpy(t29, t13, 8U);
    xsi_driver_first_trans_delta(t25, 0U, 8U, 0LL);
    xsi_set_current_line(53, ng0);
    t1 = (t0 + 1832U);
    t3 = *((char **)t1);
    t1 = (t0 + 6056);
    t4 = (t1 + 56U);
    t6 = *((char **)t4);
    t10 = (t6 + 56U);
    t11 = *((char **)t10);
    memcpy(t11, t3, 8U);
    xsi_driver_first_trans_delta(t1, 8U, 8U, 0LL);
    xsi_set_current_line(54, ng0);
    t1 = (t0 + 1992U);
    t3 = *((char **)t1);
    t1 = (t0 + 6056);
    t4 = (t1 + 56U);
    t6 = *((char **)t4);
    t10 = (t6 + 56U);
    t11 = *((char **)t10);
    memcpy(t11, t3, 16U);
    xsi_driver_first_trans_delta(t1, 16U, 16U, 0LL);
    goto LAB8;

LAB11:    xsi_set_current_line(56, ng0);
    t1 = (t0 + 2312U);
    t3 = *((char **)t1);
    t5 = *((int *)t3);
    t2 = (t5 == 0);
    if (t2 != 0)
        goto LAB24;

LAB26:
LAB25:    goto LAB8;

LAB12:    xsi_set_current_line(61, ng0);
    t1 = (t0 + 2312U);
    t3 = *((char **)t1);
    t5 = *((int *)t3);
    t2 = (t5 == 0);
    if (t2 != 0)
        goto LAB27;

LAB29:
LAB28:    goto LAB8;

LAB13:    xsi_set_current_line(66, ng0);
    t1 = (t0 + 2312U);
    t3 = *((char **)t1);
    t5 = *((int *)t3);
    t2 = (t5 == 0);
    if (t2 != 0)
        goto LAB30;

LAB32:
LAB31:    goto LAB8;

LAB14:    xsi_set_current_line(71, ng0);
    t1 = (t0 + 2952U);
    t3 = *((char **)t1);
    t5 = *((int *)t3);
    t2 = (t5 > 0);
    if (t2 != 0)
        goto LAB33;

LAB35:    xsi_set_current_line(75, ng0);
    t1 = (t0 + 5864);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t6 = (t4 + 56U);
    t10 = *((char **)t6);
    *((int *)t10) = 39;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(76, ng0);
    t1 = (t0 + 5992);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t6 = (t4 + 56U);
    t10 = *((char **)t6);
    *((unsigned char *)t10) = (unsigned char)0;
    xsi_driver_first_trans_fast(t1);

LAB34:    goto LAB8;

LAB15:    xsi_set_current_line(79, ng0);
    t1 = (t0 + 2312U);
    t3 = *((char **)t1);
    t5 = *((int *)t3);
    t2 = (t5 == 0);
    if (t2 != 0)
        goto LAB36;

LAB38:
LAB37:    goto LAB8;

LAB16:    xsi_set_current_line(47, ng0);
    t1 = (t0 + 5992);
    t6 = (t1 + 56U);
    t10 = *((char **)t6);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = (unsigned char)1;
    xsi_driver_first_trans_fast(t1);
    goto LAB17;

LAB19:    t1 = (t0 + 1352U);
    t4 = *((char **)t1);
    t15 = *((unsigned char *)t4);
    t16 = (t15 == (unsigned char)3);
    t2 = t16;
    goto LAB21;

LAB22:    xsi_size_not_matching(8U, t24, 0);
    goto LAB23;

LAB24:    xsi_set_current_line(57, ng0);
    t1 = (t0 + 5736);
    t4 = (t1 + 56U);
    t6 = *((char **)t4);
    t10 = (t6 + 56U);
    t11 = *((char **)t10);
    *((unsigned char *)t11) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(58, ng0);
    t1 = (t0 + 5992);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t6 = (t4 + 56U);
    t10 = *((char **)t6);
    *((unsigned char *)t10) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    goto LAB25;

LAB27:    xsi_set_current_line(62, ng0);
    t1 = (t0 + 2472U);
    t4 = *((char **)t1);
    t1 = (t0 + 2952U);
    t6 = *((char **)t1);
    t7 = *((int *)t6);
    t8 = (t7 - 39);
    t19 = (t8 * -1);
    xsi_vhdl_check_range_of_index(39, 0, -1, t7);
    t24 = (1U * t19);
    t30 = (0 + t24);
    t1 = (t4 + t30);
    t9 = *((unsigned char *)t1);
    t14 = ieee_p_2592010699_sub_374109322130769762_503743352(IEEE_P_2592010699, t9);
    t10 = (t0 + 5736);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t20 = *((char **)t13);
    *((unsigned char *)t20) = t14;
    xsi_driver_first_trans_fast_port(t10);
    xsi_set_current_line(63, ng0);
    t1 = (t0 + 5992);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t6 = (t4 + 56U);
    t10 = *((char **)t6);
    *((unsigned char *)t10) = (unsigned char)4;
    xsi_driver_first_trans_fast(t1);
    goto LAB28;

LAB30:    xsi_set_current_line(67, ng0);
    t1 = (t0 + 5736);
    t4 = (t1 + 56U);
    t6 = *((char **)t4);
    t10 = (t6 + 56U);
    t11 = *((char **)t10);
    *((unsigned char *)t11) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(68, ng0);
    t1 = (t0 + 5992);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t6 = (t4 + 56U);
    t10 = *((char **)t6);
    *((unsigned char *)t10) = (unsigned char)5;
    xsi_driver_first_trans_fast(t1);
    goto LAB31;

LAB33:    xsi_set_current_line(72, ng0);
    t1 = (t0 + 2952U);
    t4 = *((char **)t1);
    t7 = *((int *)t4);
    t8 = (t7 - 1);
    t1 = (t0 + 5864);
    t6 = (t1 + 56U);
    t10 = *((char **)t6);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    *((int *)t12) = t8;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(73, ng0);
    t1 = (t0 + 5992);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t6 = (t4 + 56U);
    t10 = *((char **)t6);
    *((unsigned char *)t10) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    goto LAB34;

LAB36:    xsi_set_current_line(80, ng0);
    t1 = (t0 + 3112U);
    t4 = *((char **)t1);
    t7 = *((int *)t4);
    t9 = (t7 < 5);
    if (t9 != 0)
        goto LAB39;

LAB41:    xsi_set_current_line(83, ng0);
    t1 = (t0 + 5928);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t6 = (t4 + 56U);
    t10 = *((char **)t6);
    *((int *)t10) = 0;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(84, ng0);
    t1 = (t0 + 5992);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t6 = (t4 + 56U);
    t10 = *((char **)t6);
    *((unsigned char *)t10) = (unsigned char)0;
    xsi_driver_first_trans_fast(t1);

LAB40:    goto LAB37;

LAB39:    xsi_set_current_line(81, ng0);
    t1 = (t0 + 3112U);
    t6 = *((char **)t1);
    t8 = *((int *)t6);
    t31 = (t8 + 1);
    t1 = (t0 + 5928);
    t10 = (t1 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    *((int *)t13) = t31;
    xsi_driver_first_trans_fast(t1);
    goto LAB40;

}

static void work_a_3273362230_3212880686_p_1(char *t0)
{
    char t1[16];
    char t4[16];
    char t9[16];
    char t10[16];
    char t11[16];
    char t15[16];
    char t23[16];
    char t32[16];
    char t41[16];
    char *t2;
    char *t5;
    char *t6;
    int t7;
    unsigned int t8;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    char *t16;
    char *t17;
    int t18;
    unsigned int t19;
    char *t20;
    unsigned int t21;
    unsigned int t22;
    char *t24;
    char *t25;
    int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    char *t33;
    char *t34;
    int t35;
    unsigned int t36;
    char *t37;
    char *t38;
    unsigned int t39;
    unsigned int t40;
    char *t42;
    char *t43;
    int t44;
    unsigned int t45;
    char *t46;
    char *t47;
    unsigned int t48;
    unsigned char t49;
    char *t50;
    char *t51;
    char *t52;
    char *t53;
    char *t54;
    char *t55;

LAB0:    xsi_set_current_line(92, ng0);

LAB3:    t2 = (t0 + 9960);
    t5 = (t4 + 0U);
    t6 = (t5 + 0U);
    *((int *)t6) = 0;
    t6 = (t5 + 4U);
    *((int *)t6) = 7;
    t6 = (t5 + 8U);
    *((int *)t6) = 1;
    t7 = (7 - 0);
    t8 = (t7 * 1);
    t8 = (t8 + 1);
    t6 = (t5 + 12U);
    *((unsigned int *)t6) = t8;
    t6 = (t0 + 2472U);
    t12 = *((char **)t6);
    t8 = (39 - 39);
    t13 = (t8 * 1U);
    t14 = (0 + t13);
    t6 = (t12 + t14);
    t16 = (t15 + 0U);
    t17 = (t16 + 0U);
    *((int *)t17) = 39;
    t17 = (t16 + 4U);
    *((int *)t17) = 32;
    t17 = (t16 + 8U);
    *((int *)t17) = -1;
    t18 = (32 - 39);
    t19 = (t18 * -1);
    t19 = (t19 + 1);
    t17 = (t16 + 12U);
    *((unsigned int *)t17) = t19;
    t17 = (t0 + 2472U);
    t20 = *((char **)t17);
    t19 = (39 - 31);
    t21 = (t19 * 1U);
    t22 = (0 + t21);
    t17 = (t20 + t22);
    t24 = (t23 + 0U);
    t25 = (t24 + 0U);
    *((int *)t25) = 31;
    t25 = (t24 + 4U);
    *((int *)t25) = 24;
    t25 = (t24 + 8U);
    *((int *)t25) = -1;
    t26 = (24 - 31);
    t27 = (t26 * -1);
    t27 = (t27 + 1);
    t25 = (t24 + 12U);
    *((unsigned int *)t25) = t27;
    t25 = ieee_p_3620187407_sub_1496620905533649268_3965413181(IEEE_P_3620187407, t11, t6, t15, t17, t23);
    t28 = (t0 + 2472U);
    t29 = *((char **)t28);
    t27 = (39 - 23);
    t30 = (t27 * 1U);
    t31 = (0 + t30);
    t28 = (t29 + t31);
    t33 = (t32 + 0U);
    t34 = (t33 + 0U);
    *((int *)t34) = 23;
    t34 = (t33 + 4U);
    *((int *)t34) = 16;
    t34 = (t33 + 8U);
    *((int *)t34) = -1;
    t35 = (16 - 23);
    t36 = (t35 * -1);
    t36 = (t36 + 1);
    t34 = (t33 + 12U);
    *((unsigned int *)t34) = t36;
    t34 = ieee_p_3620187407_sub_1496620905533649268_3965413181(IEEE_P_3620187407, t10, t25, t11, t28, t32);
    t37 = (t0 + 2472U);
    t38 = *((char **)t37);
    t36 = (39 - 15);
    t39 = (t36 * 1U);
    t40 = (0 + t39);
    t37 = (t38 + t40);
    t42 = (t41 + 0U);
    t43 = (t42 + 0U);
    *((int *)t43) = 15;
    t43 = (t42 + 4U);
    *((int *)t43) = 8;
    t43 = (t42 + 8U);
    *((int *)t43) = -1;
    t44 = (8 - 15);
    t45 = (t44 * -1);
    t45 = (t45 + 1);
    t43 = (t42 + 12U);
    *((unsigned int *)t43) = t45;
    t43 = ieee_p_3620187407_sub_1496620905533649268_3965413181(IEEE_P_3620187407, t9, t34, t10, t37, t41);
    t46 = ieee_p_3620187407_sub_1496620905533721142_3965413181(IEEE_P_3620187407, t1, t2, t4, t43, t9);
    t47 = (t1 + 12U);
    t45 = *((unsigned int *)t47);
    t48 = (1U * t45);
    t49 = (8U != t48);
    if (t49 == 1)
        goto LAB5;

LAB6:    t50 = (t0 + 6120);
    t51 = (t50 + 56U);
    t52 = *((char **)t51);
    t53 = (t52 + 56U);
    t54 = *((char **)t53);
    memcpy(t54, t46, 8U);
    xsi_driver_first_trans_fast(t50);

LAB2:    t55 = (t0 + 5576);
    *((int *)t55) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(8U, t48, 0);
    goto LAB6;

}

static void work_a_3273362230_3212880686_p_2(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(99, ng0);

LAB3:    t1 = (t0 + 2632U);
    t2 = *((char **)t1);
    t1 = (t0 + 6184);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 8U);
    xsi_driver_first_trans_delta(t1, 32U, 8U, 0LL);

LAB2:    t7 = (t0 + 5592);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_3273362230_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3273362230_3212880686_p_0,(void *)work_a_3273362230_3212880686_p_1,(void *)work_a_3273362230_3212880686_p_2};
	xsi_register_didat("work_a_3273362230_3212880686", "isim/HexapodTestBench_isim_beh.exe.sim/work/a_3273362230_3212880686.didat");
	xsi_register_executes(pe);
}
