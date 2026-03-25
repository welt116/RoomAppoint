package com.example.web.tools;

import com.example.web.tools.dto.CurrentUserDto;

/**
 * 当前现成中的一些公共上下文
 */
public class BaseContext {
    private static ThreadLocal<CurrentUserDto> threadLocal = new ThreadLocal<>();
    /**
     * 设置当前的用户信息
     */
    public static void setCurrentUserDto(CurrentUserDto dto){
        threadLocal.set(dto);
    }
    /**
     * 获取当前的用户信息
     */
    public static CurrentUserDto getCurrentUserDto(){
        return threadLocal.get();
    }

}
