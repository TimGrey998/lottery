package com.lottery.util;

import java.util.UUID;

public class StringUtil {
	public static String randomString(){
		UUID uuid=UUID.randomUUID();
		return uuid.toString();
		
	}
}
