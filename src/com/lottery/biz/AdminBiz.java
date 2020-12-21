package com.lottery.biz;

import com.lottery.entity.Admin;

public interface AdminBiz {
	Admin checkUser(String name,String psw);
}
