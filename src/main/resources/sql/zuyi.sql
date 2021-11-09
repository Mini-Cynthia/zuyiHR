create table nation {
    nation_id int auto_increment,
    nation_name varchar(100),
    primary key(nation_id)
};

create table company {
    company_id varchar(10), 
    company_name varchar(200),
    company_short_name varchar(50),
    nation_id int,
    company_cid varchar(10),
    company_post_code varchar(10),
    company_addr varchar(255),
    company_month_days decimal(3,1),
    company_day_hours decimal(3,1),
    primary key(company_id),
    unique(company_cide)
};

create table attendance_rules {
    company_id varchar(10),
    attendance_rule_id int auto_increment,
    attendance_rule_name varchar(20),
    overtime_method char(1), // R:補休, S:給薪
    work_type char(1), //1:一例一休 2:隔週休 3:週日休 0:無
    new_emp_spec_months int,
    new_emp_spec_days int,
    attendance_pl_month_unit int,
    attendance_pl_month_times int,
    overtime_method_cal char(1), //0:以簽核月份歸計 1:以實際加班日歸計
    overtime_increase_hours float, 
    overtime_comp_method char(1), //0:當日起算 1:次日起算 2:次月1日起算 3:次月考勤起日
    overtime_comp_keep_limit char(1), //0:加班當月月底 1:一個月整 2:2個月整.....類推至12個月整
    spec_leave_overtime_type char(1), //0:依平日加班倍率計算  1:未滿8小時給8小時
    workcard_prefix_hours decimal(3,1),
    workcard_post_hours decimal(3,1),
    primary key(company_id, attendance_rule_id)
};

create table overtime_rules {
    company_id varchar(10),
    overtime_type char(1), //0:平日, 1:休假日, 2:例假日, P:國定假日
    overtime_phase1 decimal(5,2),
    overtime_phase2 decimal(5,2),
    overtime_phase3 decimal(5,2),
    overtime_phase4 decimal(5,2),
    primary key(company_id, overtime_type)
};

create table department {
    company_id varchar(10),
    dept_id int auto_increment,
    dept_code varchar(10),
    dept_name varchar(50),
    upper_dept_id int,
    dept_mgr varchar(10),
    dept_level int,  //數字愈大，階層愈大
    disable_flag char(1) default 'Y', Y:停用 N:啟用


}