# README

* Ruby version
v2.4.1

* Rails Version
v5.2.0

* Table Schema

  Task

| attr_name  | attr_type  | default  | index  | desc  |
| ------------ | ------------ | ------------ | ------------ | ------------ |
| title | string  |   | true  |  標題 |
| description  | text  |   |   | 內容  |
| end_at  | datetime  |  | true  | 結束時間  |
| status  | integer (enum)  |   | true  | 狀態  |
| priority  | integer (enum)  |   | true  | 優先順序  |
| sort  | integer  |   | true  | 排序  |

  User

| attr_name  | attr_type  | default  | index  | desc  |
| ------------ | ------------ | ------------ | ------------ | ------------ |
| user_name | string  |   |   | 名稱 |
| email | string  |   |   | 信箱 |
| password_digest | string  |   |   | 密碼 |
| is_admin? | boolean  | false  |   | 角色 |

TaskUserRelation

| attr_name  | attr_type  | default  | index  |
| ------------ | ------------ | ------------ | ------------ |
| user_id | integer  |   | true  |
| task_id | integer  |   | true  |   |