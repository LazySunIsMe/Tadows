package com.example.tadows_v1.po;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;

/**
 * @author Lizhixian
 * @since 2024-06-14
 */
@TableName("user_role_authority_relation")
public class UserRoleAuthorityRelation implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 用户角色和用户权限关系的自增id
     */
    @TableId("ra_relation_id")
    private Integer raRelationId;

    /**
     * 用户角色id（外键）
     */
    private Integer roleId;

    /**
     * 用户权限id（外键）
     */
    private Integer authorityId;

    public Integer getRaRelationId() {
        return raRelationId;
    }

    public void setRaRelationId(Integer raRelationId) {
        this.raRelationId = raRelationId;
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public Integer getAuthorityId() {
        return authorityId;
    }

    public void setAuthorityId(Integer authorityId) {
        this.authorityId = authorityId;
    }

    @Override
    public String toString() {
        return "UserRoleAuthorityRelation{" +
        "raRelationId = " + raRelationId +
        ", roleId = " + roleId +
        ", authorityId = " + authorityId +
        "}";
    }
}
