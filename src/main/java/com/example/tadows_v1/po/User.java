package com.example.tadows_v1.po;

import com.baomidou.mybatisplus.annotation.TableId;

import java.io.Serializable;

/**
 * @author Lizhixian
 * @since 2024-06-14
 */
public class User implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 使用UUID工具类生成的32位用户编号，主要用于后端查找
     */
    @TableId("user_id")
    private String userId;

    /**
     * 工号，递增，前端封装(1->000001)
     */
    private Integer userWorkNumber;

    /**
     * 邮箱地址，用户可使用邮箱登录
     */
    private String userEmail;

    /**
     * 手机号码，用户可使用手机号登录
     */
    private String userPhoneNumber;

    /**
     * 密码，目前明文存储，后续会进行加密
     */
    private String userPassword;

    /**
     * 用户昵称
     */
    private String userNickname;

    /**
     * 用户权限
     */
    private Integer userRole;

    /**
     * 此账号是否启用（1为启用，0不启用）
     */
    private Integer ifActive;

    /**
     * 用户签名
     */
    private String userSign;

    /**
     * 性别
     */
    private Integer userGender;

    /**
     * 年龄
     */
    private Integer userAge;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public Integer getUserWorkNumber() {
        return userWorkNumber;
    }

    public void setUserWorkNumber(Integer userWorkNumber) {
        this.userWorkNumber = userWorkNumber;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserPhoneNumber() {
        return userPhoneNumber;
    }

    public void setUserPhoneNumber(String userPhoneNumber) {
        this.userPhoneNumber = userPhoneNumber;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getUserNickname() {
        return userNickname;
    }

    public void setUserNickname(String userNickname) {
        this.userNickname = userNickname;
    }

    public Integer getUserRole() {
        return userRole;
    }

    public void setUserRole(Integer userRole) {
        this.userRole = userRole;
    }

    public Integer getIfActive() {
        return ifActive;
    }

    public void setIfActive(Integer ifActive) {
        this.ifActive = ifActive;
    }

    public String getUserSign() {
        return userSign;
    }

    public void setUserSign(String userSign) {
        this.userSign = userSign;
    }

    public Integer getUserGender() {
        return userGender;
    }

    public void setUserGender(Integer userGender) {
        this.userGender = userGender;
    }

    public Integer getUserAge() {
        return userAge;
    }

    public void setUserAge(Integer userAge) {
        this.userAge = userAge;
    }

    @Override
    public String toString() {
        return "User{" +
        "userId = " + userId +
        ", userWorkNumber = " + userWorkNumber +
        ", userEmail = " + userEmail +
        ", userPhoneNumber = " + userPhoneNumber +
        ", userPassword = " + userPassword +
        ", userNickname = " + userNickname +
        ", userRole = " + userRole +
        ", ifActive = " + ifActive +
        ", userSign = " + userSign +
        ", userGender = " + userGender +
        ", userAge = " + userAge +
        "}";
    }
}
