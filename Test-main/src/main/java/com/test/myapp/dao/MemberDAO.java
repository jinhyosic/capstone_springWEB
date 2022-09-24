package com.test.myapp.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface MemberDAO {
    public String getName(@Param("id")String id, @Param("pw")String pw);
    public void setUser(@Param("id")String id, @Param("pw")String pw,
                          @Param("gender")String gender, @Param("name")String name, @Param("authority")String authority);

}
