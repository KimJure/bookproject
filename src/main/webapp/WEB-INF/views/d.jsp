<select id="getTotalCount" resultType="int" parameterType="map">
        SELECT COUNT(*) as totalCount
        FROM member
        WHERE state = 1 or
        	  state = 2 or
        	  state = 3
    </select>

   <select id="getListByRange" resultType="kr.co.dong.member.MemberDTO" parameterType="java.util.Map">
    SELECT *
    FROM member
     WHERE state = 1 or
        	  state = 2 or
        	  state = 3
    <if test="keyword != null and keyword != ''">
        AND (
            id LIKE CONCAT('%', #{keyword}, '%')
            OR name LIKE CONCAT('%', #{keyword}, '%')
            OR state LIKE CONCAT('%', #{keyword}, '%')
            OR authority LIKE CONCAT('%', #{keyword}, '%')
            OR joindate LIKE CONCAT('%', #{keyword}, '%')
        )
    </if>
    ORDER BY
    <choose>
        <when test="sortBy eq 'id'">id ASC</when>
        <when test="sortBy eq 'name'">name ASC</when>
        <when test="sortBy eq 'state'">state ASC</when>
        <when test="sortBy eq 'authority'">authority ASC</when>
        <when test="sortBy eq 'idDesc'">id DESC</when>
        <when test="sortBy eq 'nameDesc'">name DESC</when>
        <when test="sortBy eq 'stateDesc'">state DESC</when>
        <when test="sortBy eq 'authorityDesc'">authority DESC</when>
        <when test="sortBy eq 'joindateDesc'">joindate DESC</when>
        <otherwise>CASE WHEN state = 1 THEN 0 ELSE 1 END, joindate DESC</otherwise>
    </choose>
    LIMIT #{startIdx}, #{endIdx}
</select>