package com.test.myapp.service;

import org.apache.ibatis.annotations.Param;

public interface MemberService {
    public String getName(String id, String pw);
    public void setUser(@Param("id")String id, @Param("pw")String pw,
                          @Param("gender")String gender, @Param("name")String name, @Param("authority")String authority);
}
