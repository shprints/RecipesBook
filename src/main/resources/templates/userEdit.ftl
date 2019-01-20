<#import "parts/common.ftl" as c>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<@c.page>

        <body background="../static/roles.jpg" style="background-size: 100%;">
        <div class="col-9 rounded"  style=" margin-left: 200px; width: 60%; display: inline-block; background: url(../static/rolesBackground.jpg);">

            <h1 class="h3 mb-3 font-weight-normal" align="left">
                <b>Change user role:</b></h1>
<form action="/user" method="post">
    <b> <#list roles as role>
     <div class="text-left col-9"  style="display: inline-block; margin-left: 50px;">
        <label><input type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}>${role}</label>
     </div>
    </#list></b>
    <input type="hidden" value="${user.id}" name="userId">
    <div class="text-right">
    <button type="submit" class="btn btn btn-primary">Save</button>
    </div>
</form>
</div>
</body>
</@c.page>