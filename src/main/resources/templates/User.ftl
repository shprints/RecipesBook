<#import "parts/common.ftl" as c>
<#include "parts/login.ftl">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<meta charset="utf-8">
<@c.page>
<body background="../static/roles.jpg" style="background-size: 100%;">
<div class="list-header px-3 py-3 pt-md-5 pb-md-4 mx-auto">

    <h1 class="display-6">
        <em>
            Personal area of user: ${user.username}</em></h1>
    <p class="lead  my-1">
        <em>
            On this page, administrator can view, delete and edit user recipes.
        </em>
    </p>


    <footer class="pt-4 my-md5 pt-md-3 border-top"></footer>

    <div class="mb-0"><h2 class="h3">
        <i>Search by title</i></h2>
        <label></label>
        <form method="post" action="/Filter" class="form-inline my-2 my-lg-2">
        <input type="text" name="ffilterr" class="form-control mr-sm-2" placeholder="Search"  size="60%">
        <button type="submit" class="btn btn-primary">Search</button>
    </form>
        <button onclick="onClickBtnDeleteSummery()" class="btn btn-outline-primary">Delete</button>
</div>
    <br> <table class="table table-striped" id="table-set">

<thead>
<tr>

    <th>
        <button onclick="onClickBtnAllSummeries()" class="btn btn-outline-primary">All</button>
    </th>
    <th scope="col">Title</th>
    <th scope="col">Descript</th>
    <th scope="col">Main ingredient</th>
    <th scope="col">Rating</th>
    <th scope="col">Ingredients</th>
    <th scope="col">Last edited date</th>

</tr>
</thead>
<tbody>
    <#list summs as s>
    <tr>
        <th>
            <input type="checkbox" value="${s.id}">
        </th>
        <td><a href="/Recipes/Page/${s.id}"><u><em>${s.title}</em></u></a></td>
        <td>${s.descript}</td>
        <td>${s.number}</td>
        <#if s.ratings==0>
        <td>without rating</td>
        <#else >
        <td>${s.ratings}</td>
        </#if>
        <td><#list s.tags as tag>
            <a href="/Recipes/Page/${s.id}">${tag.tags} </a>
        <#else >
                No tags
        </#list>
        </td>
        <td>${s.dateChange}</td>
    </tr>
    </#list>
<script>
    var checkVar = false;
    function onClickBtnAllSummeries(){
        if (checkVar == false) {
            $('body input:checkbox').prop('checked', true);
            checkVar = !checkVar;
        } else {
            $('body input:checkbox').prop('checked', false);
            checkVar = !checkVar;
        }

    }
    function getArrayIdSummeries(){
        arrayIdSummeries = [];

        $('input:checkbox:checked').each(function(){
            arrayIdSummeries.push($(this).val());
        });

        return arrayIdSummeries;
    }
</script>

<script>
    function onClickBtnDeleteSummery(){
        idSummeries = getArrayIdSummeries();

        $.ajax({
            url: '/deletesummeries',
            dataType: 'json',
            data: JSON.stringify(idSummeries),
            contentType: "application/json",
            type: 'post',
            success: function(settings){
                if(settings=="1") {
                    window.location.reload()
                }else{
                    document.location.href = "http://localhost:8080/login?logout";
                }
            }
        });
    }
</script>

</tbody>
</table>

</form>
</body>
    <footer class="pt-4 my-md5 pt-md-3 border-top"></footer>
    <footer class="footer">

        <div class="container text-center">
            © Company 2019. Shprints Konstantsin
        </div>
    </footer>

</@c.page>
