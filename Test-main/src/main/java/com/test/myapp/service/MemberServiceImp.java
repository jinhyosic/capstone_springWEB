package com.test.myapp.service;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.myapp.dao.MemberDAO;

@Service
public class MemberServiceImp implements MemberService {
    @Autowired
    MemberDAO memberDao;

    @Override
    public String getName(String id, String pw) {
        String res = null;
        try {
            res = memberDao.getName(id, pw);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }

    public void setUser(@Param("id")String id, @Param("pw")String pw,
                          @Param("gender")String gender, @Param("name")String name, @Param("authority")String authority){
        String res = null;
        try {
            memberDao.setUser(id, pw, gender, name, authority);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
