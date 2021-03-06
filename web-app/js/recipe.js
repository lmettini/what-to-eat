
function firstStepOk(){
    if ($("#title").val().length==0){
        $(".alert-title").show();
        return false;
    }

    if ($("#categ").val()==0){
        $(".alert-categ").show();
        return false;
    }

    if($("#summary").val().length>200){
        $(".alert-desc").show();
        return false
    }
    return true;
}

$("#descrip").focus(function(){
    $("#tab2Alert").hide();
});

$("#title").focus(function(){
    $(".alert-title").hide();
});

$("#categ").focus(function(){
    $(".alert-categ").hide();
});

$("#t-2").bind("click",function(event){
    if(!firstStepOk()){

        event.preventDefault();
        event.stopPropagation();
    }
});

$("#nxtFS").bind("click",function(){
    $("#t-2").click();
});

function updateCounter(){
    var count = $("#descrip").val().length;

    if(count>5000){
        $("#counter").addClass("badge-important");
    } else{
        $("#counter").removeClass("badge-important");
    }

    $("#counter").html(5000-count);
}

$("#descrip").keyup(function(){updateCounter()});

$("#descrip").keydown(function(){setTimeout(updateCounter,100)});

function updateSumaryCounter(){
    var count = $("#summary").val().length;

    if(count>200){
        $("#summarycounter").addClass("badge-important");
    } else{
        $("#summarycounter").removeClass("badge-important");
    }

    $("#summarycounter").html(200-count);
}

$("#summary").keyup(function(){updateSumaryCounter()});

$("#summary").keydown(function(){setTimeout(updateSumaryCounter,100)});

var ingredients = [];

$(".add-ing").click(function (){
    hideIngredAlerts();
    var ing = $("#ingred").tokenInput("get");
    var qty = $("#qty").val();
    var unit = $("#units").val();

    // los campos cantidad y medida son optativos
    //if (ing.length!=1 || qty=="" || qty<=0 || unit==0){
    if (ing.length!=1 || qty<0 ){
        $("#ing-alert1").show();
        return
    }

    if(idxOfIng(ing[0].id)!=-1){
        $("#ing-alert3").show();
        return
    }

    var ingrHtml = '<div id="ing-'+ing[0].id+'" class="alert token-ingredient" x-ingid="'+ing[0].id+'" x-qty="'+qty+'" x-unit="'+unit+'" x-id="'+ing[0].id+'">'+qty+' '+$("#units option:selected").text()+' '+ing[0].name+'<button onclick="deleteIngred('+ing[0].id+')" type="button" class="close" >×</button></div>'
    $("#select-ing .controls").append(ingrHtml);

    $("#select-ing").show();
    ingredients[ingredients.length] = ({id:ing[0].id,name:ing[0].name,qty:qty,unit:unit});
    $("#ingred").tokenInput("clear");
    $("#qty").val("");
    $("#units").val(0);

});

$("#qty").focus(function(){
    hideIngredAlerts();
});
$("#units").focus(function(){
    hideIngredAlerts();
});

function hideIngredAlerts(){
    $("#ing-alert1").hide();
    $("#ing-alert2").hide();
    $("#ing-alert3").hide();
}



function deleteIngred(id){
    var idx = idxOfIng(id);
    if(idx!=-1) ingredients.splice(idx, 1);
    $("#ing-"+id).remove();
    if($(".token-ingredient").length==0){
        $("#select-ing").hide();
    }
}
function idxOfIng(id){
    for(var i=0; i<ingredients.length;i++){
        if(ingredients[i].id==id){
            return i
        }
    }
    return -1;
}


$("#descrip").focus(function(){$(".alert-desc").hide()});
$("#summary").focus(function(){$(".alert-desc").hide()});

function secondtStepOk(){
    if (ingredients.length==0 && $(".ingredient-row").length==0){
        $("#ing-alert2").show();
        return false
    }
    if($("#descrip").val().length>5000){
        $(".alert-desc").show();
        return false
    }
    return true;
}

$("#submit-but").click(function (){
    if(!secondtStepOk())return;

    var ings ="";
     $(".token-ingredient").each(function(i){
        if(i!=0)ings+=",";
        ings += "{ingredId: '"+$(this).attr("x-ingid")+ "', qty: '"+$(this).attr("x-qty")+"' "+",unit: '"+$(this).attr("x-unit")+"' }"
    });

    var imgs ="";
    $("#imgListRec > li[x-data-id]").each(function(i){
        if(i!=0)imgs+=",";
        imgs += $(this).attr("x-data-id");
    });
    var video;
    if($("#video").val().split('=').length != 1)
        video = "http://www.youtube.com/v/" + $("#video").val().split('=')[1];
    else
        video = $("#video").val();

    var json = "{action:'"+action+"', title: '"+$("#title").val()+"' , ingredientes: ["+ings+"] , images: ["+imgs+"], summary: '"+$("#summary").val() +"', descripcion: '"+$("#descrip").val()+"', recipeId: '"+$("#recipeId").val()+"', categ: '"+$("#categ").val()+"', video: '"+video+"' }";

	var myEscapedJSONString = json.escapeSpecialChars();
	var jsonEncoded = encodeURIComponent(myEscapedJSONString)

    //document.location = "/recipe/save?data="+jsonEncoded;
    document.location = "/recipe/save?data="+jsonEncoded;

});

String.prototype.escapeSpecialChars = function() {
    return this.replace(/[\"]/g, '\\"')
      .replace(/[\\]/g, '\\\\')
      .replace(/[\/]/g, '\\/')
      .replace(/[\b]/g, '\\b')
      .replace(/[\f]/g, '\\f')
      .replace(/[\n]/g, '\\n')
      .replace(/[\r]/g, '\\r')
      .replace(/[\t]/g, '\\t');
};


function addImageInsideModal(img) {
    var html = createImgListTag(img);
    $("#imgListRec").append(html);
    $("#imgListModal").append(html);
    $('#photoimg').attr("value","");

}

function createImgListTag(img){
    return "<li x-data-id='"+img.id+"'><img src='"+img.thumbnail+"' width='90' height='90'/><a href='javascript:deteleImage("+img.id+")'>Eliminar</a></li>"
}

function deteleImage(id){
    $("li[x-data-id="+id+"]").remove();
}

function alertImgMessage(msg){
    $(".alert-img").html(msg).show()
}

$('#photoimg').click(function(){
    $(".alert-img").hide()
});
