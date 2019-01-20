<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdn.rawgit.com/toopay/bootstrap-markdown/master/js/bootstrap-markdown.js"></script>
<link rel="stylesheet" href="https://cdn.rawgit.com/toopay/bootstrap-markdown/master/css/bootstrap-markdown.min.css" />
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/simplemde/latest/simplemde.min.css">
<script src="https://cdn.jsdelivr.net/simplemde/latest/simplemde.min.js"></script>
  <link rel="stylesheet" href="style.css" />
    <meta charset="utf-8">

<@c.page>
<body class="bg-light">
<div class="text-center">
    <h1 class="display-6">
        <#if language=="Russian">
            Новый рецепт:</h1></div>
        <#else>
            New recipe:</h1></div>
        </#if>

<form method="post" action="/NewRecipe">
    <div class="form-group row">
    <#if language=="Russian">
        <label class="col-sm-2 col-form-label"> Заголовок:</label>
        <div class="col-sm-10">
            <input type="text" name="title" class="form-control" placeholder="Заголовок" minlength="1"/>
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label"> Вид блюда: </label>
        <div class="col-sm-10">
            <input type="text" name="descript" class="form-control" placeholder="Соус, десерт, первое блюдо, аперитив..."/>
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label"> Основной ингредиент:</label>
        <div class="col-sm-10">
            <input minlength="1" type="text" name="number" class="form-control" placeholder="Основной ингредиент"/>
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label"> Ингредиенты (перечисление):</label>
        <div class="col-sm-10">
            <input minlength="1" type="text" name="tags" class="form-control" placeholder="Ингредиенты"/>
        </div>

    </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label"> Картинка:</label>
        <div class="col-sm-10">
            <input name="imageURL" type="url" class="form-control" placeholder="Картинка">

        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label"> Ингредиенты & Метод & Method:</label>
    <#else>
        <label class="col-sm-2 col-form-label"> Title:</label>
        <div class="col-sm-10">
            <input type="text" name="title" class="form-control" placeholder="Title" minlength="1"/>
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label"> Type of dish: </label>
        <div class="col-sm-10">
            <input type="text" name="descript" class="form-control" placeholder="Sauce, dessert, first course, appetizer..."/>
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label"> Main ingredient:</label>
        <div class="col-sm-10">
            <input minlength="1" type="text" name="number" class="form-control" placeholder="Main ingredients"/>
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label"> Ingredients (list):</label>
        <div class="col-sm-10">
            <input minlength="1" type="text" name="tags" class="form-control" placeholder="Ingredients"/>
        </div>

    </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label"> Picture:</label>
        <div class="col-sm-10">
            <input name="imageURL" type="url" class="form-control" placeholder="Picture">

        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label"> Ingredients & Method:</label>
    </#if>

    <#--<div class="col-sm-10">-->
    <#--<input minlength="1" type="text" name="text" class="form-control" placeholder="Text"/>-->
    <#--</div>-->

        <div class="col-sm-10">
            <script>
                $(document).ready(function () {
                    createMarkdown(document.getElementById("area"));
                    function createMarkdown(textarea) {
                        simplemde = new SimpleMDE({
                            element: textarea
                        })}
                });
            </script>
            <br> <div class="form-group">
            <textarea class="form-control" id="area" rows="100" name="text"></textarea>
        </div>
        </div>
    </div>
    <p align="right">
        <button class="btn btn-primary" type="submit">Save</button>
    </p>
</form>
</body>
</@c.page>
