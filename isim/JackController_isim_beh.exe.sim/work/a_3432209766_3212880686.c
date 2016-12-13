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
static const char *ng0 = "/home/nabav/Workspace/HexapodTestBench/Frame_Receiver.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_3620187407;

unsigned char ieee_p_2592010699_sub_2763492388968962707_503743352(char *, char *, unsigned int , unsigned int );
char *ieee_p_3620187407_sub_1496620905533649268_3965413181(char *, char *, char *, char *, char *, char *);


static void work_a_3432209766_3212880686_p_0(char *t0)
{
    char t24[16];
    char t25[16];
    char t32[16];
    char *t1;
    unsigned char t2;
    unsigned char t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t8;
    unsigned char t9;
    unsigned char t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    int t15;
    int t16;
    int t17;
    int t18;
    int t19;
    char *t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t26;
    unsigned char t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    char *t33;
    char *t34;
    char *t35;

LAB0:    xsi_set_current_line(34, ng0);
    t1 = (t0 + 992U);
    t2 = ieee_p_2592010699_sub_2763492388968962707_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 5720);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(35, ng0);
    t4 = (t0 + 3928U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)3);
    if (t7 == 1)
        goto LAB8;

LAB9:    t3 = (unsigned char)0;

LAB10:    if (t3 != 0)
        goto LAB5;

LAB7:    t1 = (t0 + 2792U);
    t4 = *((char **)t1);
    t15 = *((int *)t4);
    t1 = (t0 + 3808U);
    t5 = *((char **)t1);
    t16 = *((int *)t5);
    t17 = (3 * t16);
    t3 = (t15 < t17);
    if (t3 == 1)
        goto LAB13;

LAB14:    t2 = (unsigned char)0;

LAB15:    if (t2 != 0)
        goto LAB11;

LAB12:    t1 = (t0 + 3928U);
    t4 = *((char **)t1);
    t3 = *((unsigned char *)t4);
    t6 = (t3 == (unsigned char)2);
    if (t6 == 1)
        goto LAB18;

LAB19:    t2 = (unsigned char)0;

LAB20:    if (t2 != 0)
        goto LAB16;

LAB17:
LAB6:    xsi_set_current_line(43, ng0);
    t1 = (t0 + 3272U);
    t4 = *((char **)t1);
    t2 = *((unsigned char *)t4);
    t3 = (t2 == (unsigned char)3);
    if (t3 != 0)
        goto LAB23;

LAB25:
LAB24:    xsi_set_current_line(56, ng0);
    t1 = (t0 + 1192U);
    t4 = *((char **)t1);
    t2 = *((unsigned char *)t4);
    t1 = (t0 + 3928U);
    t5 = *((char **)t1);
    t1 = (t5 + 0);
    *((unsigned char *)t1) = t2;
    goto LAB3;

LAB5:    xsi_set_current_line(36, ng0);
    t4 = (t0 + 5832);
    t11 = (t4 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    *((int *)t14) = 0;
    xsi_driver_first_trans_fast(t4);
    goto LAB6;

LAB8:    t4 = (t0 + 1192U);
    t8 = *((char **)t4);
    t9 = *((unsigned char *)t8);
    t10 = (t9 == (unsigned char)2);
    t3 = t10;
    goto LAB10;

LAB11:    xsi_set_current_line(38, ng0);
    t1 = (t0 + 2792U);
    t11 = *((char **)t1);
    t18 = *((int *)t11);
    t19 = (t18 + 1);
    t1 = (t0 + 5832);
    t12 = (t1 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t20 = *((char **)t14);
    *((int *)t20) = t19;
    xsi_driver_first_trans_fast(t1);
    goto LAB6;

LAB13:    t1 = (t0 + 1192U);
    t8 = *((char **)t1);
    t6 = *((unsigned char *)t8);
    t7 = (t6 == (unsigned char)2);
    t2 = t7;
    goto LAB15;

LAB16:    xsi_set_current_line(40, ng0);
    t1 = (t0 + 2312U);
    t8 = *((char **)t1);
    t21 = (39 - 38);
    t22 = (t21 * 1U);
    t23 = (0 + t22);
    t1 = (t8 + t23);
    t11 = (t0 + 3112U);
    t12 = *((char **)t11);
    t10 = *((unsigned char *)t12);
    t13 = ((IEEE_P_2592010699) + 4000);
    t14 = (t25 + 0U);
    t20 = (t14 + 0U);
    *((int *)t20) = 38;
    t20 = (t14 + 4U);
    *((int *)t20) = 0;
    t20 = (t14 + 8U);
    *((int *)t20) = -1;
    t15 = (0 - 38);
    t26 = (t15 * -1);
    t26 = (t26 + 1);
    t20 = (t14 + 12U);
    *((unsigned int *)t20) = t26;
    t11 = xsi_base_array_concat(t11, t24, t13, (char)97, t1, t25, (char)99, t10, (char)101);
    t26 = (39U + 1U);
    t27 = (40U != t26);
    if (t27 == 1)
        goto LAB21;

LAB22:    t20 = (t0 + 5896);
    t28 = (t20 + 56U);
    t29 = *((char **)t28);
    t30 = (t29 + 56U);
    t31 = *((char **)t30);
    memcpy(t31, t11, 40U);
    xsi_driver_first_trans_fast(t20);
    xsi_set_current_line(41, ng0);
    t1 = (t0 + 5960);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    *((unsigned char *)t11) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    goto LAB6;

LAB18:    t1 = (t0 + 1192U);
    t5 = *((char **)t1);
    t7 = *((unsigned char *)t5);
    t9 = (t7 == (unsigned char)3);
    t2 = t9;
    goto LAB20;

LAB21:    xsi_size_not_matching(40U, t26, 0);
    goto LAB22;

LAB23:    xsi_set_current_line(44, ng0);
    t1 = (t0 + 5960);
    t5 = (t1 + 56U);
    t8 = *((char **)t5);
    t11 = (t8 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(45, ng0);
    t1 = (t0 + 2312U);
    t4 = *((char **)t1);
    t21 = (39 - 39);
    t22 = (t21 * 1U);
    t23 = (0 + t22);
    t1 = (t4 + t23);
    t5 = (t24 + 0U);
    t8 = (t5 + 0U);
    *((int *)t8) = 39;
    t8 = (t5 + 4U);
    *((int *)t8) = 37;
    t8 = (t5 + 8U);
    *((int *)t8) = -1;
    t15 = (37 - 39);
    t26 = (t15 * -1);
    t26 = (t26 + 1);
    t8 = (t5 + 12U);
    *((unsigned int *)t8) = t26;
    t8 = (t0 + 10027);
    t12 = (t25 + 0U);
    t13 = (t12 + 0U);
    *((int *)t13) = 0;
    t13 = (t12 + 4U);
    *((int *)t13) = 2;
    t13 = (t12 + 8U);
    *((int *)t13) = 1;
    t16 = (2 - 0);
    t26 = (t16 * 1);
    t26 = (t26 + 1);
    t13 = (t12 + 12U);
    *((unsigned int *)t13) = t26;
    t3 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t1, t24, t8, t25);
    if (t3 == 1)
        goto LAB29;

LAB30:    t2 = (unsigned char)0;

LAB31:    if (t2 != 0)
        goto LAB26;

LAB28:    xsi_set_current_line(53, ng0);
    t1 = (t0 + 6024);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    *((unsigned char *)t11) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);

LAB27:    goto LAB24;

LAB26:    xsi_set_current_line(46, ng0);
    t30 = (t0 + 6024);
    t31 = (t30 + 56U);
    t33 = *((char **)t31);
    t34 = (t33 + 56U);
    t35 = *((char **)t34);
    *((unsigned char *)t35) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t30);
    xsi_set_current_line(47, ng0);
    t1 = (t0 + 2312U);
    t4 = *((char **)t1);
    t21 = (39 - 36);
    t22 = (t21 * 1U);
    t23 = (0 + t22);
    t1 = (t4 + t23);
    t5 = (t0 + 6088);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t1, 2U);
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(48, ng0);
    t1 = (t0 + 2312U);
    t4 = *((char **)t1);
    t21 = (39 - 34);
    t22 = (t21 * 1U);
    t23 = (0 + t22);
    t1 = (t4 + t23);
    t5 = (t0 + 6152);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t1, 3U);
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(49, ng0);
    t1 = (t0 + 2312U);
    t4 = *((char **)t1);
    t21 = (39 - 31);
    t22 = (t21 * 1U);
    t23 = (0 + t22);
    t1 = (t4 + t23);
    t5 = (t0 + 6216);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t1, 8U);
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(50, ng0);
    t1 = (t0 + 2312U);
    t4 = *((char **)t1);
    t21 = (39 - 23);
    t22 = (t21 * 1U);
    t23 = (0 + t22);
    t1 = (t4 + t23);
    t5 = (t0 + 6280);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t1, 16U);
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(51, ng0);
    t1 = xsi_get_transient_memory(40U);
    memset(t1, 0, 40U);
    t4 = t1;
    memset(t4, (unsigned char)2, 40U);
    t5 = (t0 + 5896);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t1, 40U);
    xsi_driver_first_trans_fast(t5);
    goto LAB27;

LAB29:    t13 = (t0 + 2472U);
    t14 = *((char **)t13);
    t13 = (t0 + 9872U);
    t20 = (t0 + 10030);
    t29 = (t32 + 0U);
    t30 = (t29 + 0U);
    *((int *)t30) = 0;
    t30 = (t29 + 4U);
    *((int *)t30) = 7;
    t30 = (t29 + 8U);
    *((int *)t30) = 1;
    t17 = (7 - 0);
    t26 = (t17 * 1);
    t26 = (t26 + 1);
    t30 = (t29 + 12U);
    *((unsigned int *)t30) = t26;
    t6 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t14, t13, t20, t32);
    t2 = t6;
    goto LAB31;

}

static void work_a_3432209766_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    char *t4;
    int t5;
    int t6;
    int t7;
    unsigned char t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;

LAB0:    xsi_set_current_line(60, ng0);
    t1 = (t0 + 2792U);
    t2 = *((char **)t1);
    t3 = *((int *)t2);
    t1 = (t0 + 3808U);
    t4 = *((char **)t1);
    t5 = *((int *)t4);
    t6 = (3 * t5);
    t7 = (t6 / 2);
    t8 = (t3 < t7);
    if (t8 != 0)
        goto LAB3;

LAB4:
LAB5:    t13 = (t0 + 6344);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    *((unsigned char *)t17) = (unsigned char)3;
    xsi_driver_first_trans_fast(t13);

LAB2:    t18 = (t0 + 5736);
    *((int *)t18) = 1;

LAB1:    return;
LAB3:    t1 = (t0 + 6344);
    t9 = (t1 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    goto LAB2;

LAB6:    goto LAB2;

}

static void work_a_3432209766_3212880686_p_2(char *t0)
{
    char t1[16];
    char t2[16];
    char t3[16];
    char t4[16];
    char t10[16];
    char t18[16];
    char t27[16];
    char t36[16];
    char t45[16];
    char *t5;
    char *t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    char *t11;
    char *t12;
    int t13;
    unsigned int t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    char *t19;
    char *t20;
    int t21;
    unsigned int t22;
    char *t23;
    char *t24;
    unsigned int t25;
    unsigned int t26;
    char *t28;
    char *t29;
    int t30;
    unsigned int t31;
    char *t32;
    char *t33;
    unsigned int t34;
    unsigned int t35;
    char *t37;
    char *t38;
    int t39;
    unsigned int t40;
    char *t41;
    char *t42;
    unsigned int t43;
    unsigned int t44;
    char *t46;
    char *t47;
    int t48;
    unsigned int t49;
    char *t50;
    unsigned int t51;
    unsigned char t52;
    char *t53;
    char *t54;
    char *t55;
    char *t56;
    char *t57;
    char *t58;

LAB0:    xsi_set_current_line(62, ng0);

LAB3:    t5 = (t0 + 2312U);
    t6 = *((char **)t5);
    t7 = (39 - 39);
    t8 = (t7 * 1U);
    t9 = (0 + t8);
    t5 = (t6 + t9);
    t11 = (t10 + 0U);
    t12 = (t11 + 0U);
    *((int *)t12) = 39;
    t12 = (t11 + 4U);
    *((int *)t12) = 32;
    t12 = (t11 + 8U);
    *((int *)t12) = -1;
    t13 = (32 - 39);
    t14 = (t13 * -1);
    t14 = (t14 + 1);
    t12 = (t11 + 12U);
    *((unsigned int *)t12) = t14;
    t12 = (t0 + 2312U);
    t15 = *((char **)t12);
    t14 = (39 - 31);
    t16 = (t14 * 1U);
    t17 = (0 + t16);
    t12 = (t15 + t17);
    t19 = (t18 + 0U);
    t20 = (t19 + 0U);
    *((int *)t20) = 31;
    t20 = (t19 + 4U);
    *((int *)t20) = 24;
    t20 = (t19 + 8U);
    *((int *)t20) = -1;
    t21 = (24 - 31);
    t22 = (t21 * -1);
    t22 = (t22 + 1);
    t20 = (t19 + 12U);
    *((unsigned int *)t20) = t22;
    t20 = ieee_p_3620187407_sub_1496620905533649268_3965413181(IEEE_P_3620187407, t4, t5, t10, t12, t18);
    t23 = (t0 + 2312U);
    t24 = *((char **)t23);
    t22 = (39 - 23);
    t25 = (t22 * 1U);
    t26 = (0 + t25);
    t23 = (t24 + t26);
    t28 = (t27 + 0U);
    t29 = (t28 + 0U);
    *((int *)t29) = 23;
    t29 = (t28 + 4U);
    *((int *)t29) = 16;
    t29 = (t28 + 8U);
    *((int *)t29) = -1;
    t30 = (16 - 23);
    t31 = (t30 * -1);
    t31 = (t31 + 1);
    t29 = (t28 + 12U);
    *((unsigned int *)t29) = t31;
    t29 = ieee_p_3620187407_sub_1496620905533649268_3965413181(IEEE_P_3620187407, t3, t20, t4, t23, t27);
    t32 = (t0 + 2312U);
    t33 = *((char **)t32);
    t31 = (39 - 15);
    t34 = (t31 * 1U);
    t35 = (0 + t34);
    t32 = (t33 + t35);
    t37 = (t36 + 0U);
    t38 = (t37 + 0U);
    *((int *)t38) = 15;
    t38 = (t37 + 4U);
    *((int *)t38) = 8;
    t38 = (t37 + 8U);
    *((int *)t38) = -1;
    t39 = (8 - 15);
    t40 = (t39 * -1);
    t40 = (t40 + 1);
    t38 = (t37 + 12U);
    *((unsigned int *)t38) = t40;
    t38 = ieee_p_3620187407_sub_1496620905533649268_3965413181(IEEE_P_3620187407, t2, t29, t3, t32, t36);
    t41 = (t0 + 2312U);
    t42 = *((char **)t41);
    t40 = (39 - 7);
    t43 = (t40 * 1U);
    t44 = (0 + t43);
    t41 = (t42 + t44);
    t46 = (t45 + 0U);
    t47 = (t46 + 0U);
    *((int *)t47) = 7;
    t47 = (t46 + 4U);
    *((int *)t47) = 0;
    t47 = (t46 + 8U);
    *((int *)t47) = -1;
    t48 = (0 - 7);
    t49 = (t48 * -1);
    t49 = (t49 + 1);
    t47 = (t46 + 12U);
    *((unsigned int *)t47) = t49;
    t47 = ieee_p_3620187407_sub_1496620905533649268_3965413181(IEEE_P_3620187407, t1, t38, t2, t41, t45);
    t50 = (t1 + 12U);
    t49 = *((unsigned int *)t50);
    t51 = (1U * t49);
    t52 = (8U != t51);
    if (t52 == 1)
        goto LAB5;

LAB6:    t53 = (t0 + 6408);
    t54 = (t53 + 56U);
    t55 = *((char **)t54);
    t56 = (t55 + 56U);
    t57 = *((char **)t56);
    memcpy(t57, t47, 8U);
    xsi_driver_first_trans_fast(t53);

LAB2:    t58 = (t0 + 5752);
    *((int *)t58) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(8U, t51, 0);
    goto LAB6;

}


extern void work_a_3432209766_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3432209766_3212880686_p_0,(void *)work_a_3432209766_3212880686_p_1,(void *)work_a_3432209766_3212880686_p_2};
	xsi_register_didat("work_a_3432209766_3212880686", "isim/JackController_isim_beh.exe.sim/work/a_3432209766_3212880686.didat");
	xsi_register_executes(pe);
}
