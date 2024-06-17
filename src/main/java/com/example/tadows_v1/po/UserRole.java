package com.example.tadows_v1.po;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;

/**
 * @author Lizhixian
 * @since 2024-06-14
 */
@TableName("user_role")
public class UserRole implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 用户角色的自增id
     */
    @TableId("role_id")
    private Integer roleId;

    /**
     * 角色名
     */
    private String roleName;

    /**
     * 角色描述（这个角色要干啥）
     */
    private String roleDescription;

    /**
     * 该角色是否启用（0->不启用，1->启用）
     */
    private Integer roleStatus;

    /**
     * 角色优先级
     */
    private Integer sort;

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getRoleDescription() {
        return roleDescription;
    }

    public void setRoleDescription(String roleDescription) {
        this.roleDescription = roleDescription;
    }

    public Integer getRoleStatus() {
        return roleStatus;
    }

    public void setRoleStatus(Integer roleStatus) {
        this.roleStatus = roleStatus;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    @Override
    public String toString() {
        return "UserRole{" +
        "roleId = " + roleId +
        ", roleName = " + roleName +
        ", roleDescription = " + roleDescription +
        ", roleStatus = " + roleStatus +
        ", sort = " + sort +
        "}";
    }
}
