
function firstStepOk(){
    if ($("#title").val().length==0){
        return false;
    }
    return true;
}

$("#title").focus(function(){
    $(".alert-title").hide();
});

$("#t-2").bind("click",function(event){
    if(!firstStepOk()){
        $(".alert-title").show();

        event.preventDefault();
        event.stopPropagation();
    }
});

$("#nxtFS").bind("click",function(){
    $("#t-2").click();
});

function updateCounter(){
    var count = $("#descrip").val().length;

    if(count>200){
        $("#counter").addClass("badge-important");
    } else{
        $("#counter").removeClass("badge-important");
    }

    $("#counter").html(200-count);
}

$("#descrip").keyup(function(){updateCounter()});

$("#descrip").keydown(function(){setTimeout(updateCounter,100)});


var ingredients = [];

$(".add-ing").click(function (){
    hideIngredAlerts();
    var ing = $("#ingred").tokenInput("get");
    var qty = $("#qty").val();
    var unit = $("#units").val();

    if (ing.length!=1 || qty=="" || qty<=0 || unit==0){
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

function secondtStepOk(){
    if (ingredients.length==0){
        $("#ing-alert2").show();
        return false
    }
    if($("#descrip").val().length>200){
        $(".alert-desc").show();
    }
    return true;
}

$("#submit-but").click(function (){
    if(!secondtStepOk())return;

    var ings ="";
     $(".token-ingredient").each(function(i){
        if(i!=0)ings+=",";
        ings += "id-ingrediente: '"+$(this).attr("x-ingid")+ "' qty: '"+$(this).attr("x-qty")+"' "+"unit: '"+$(this).attr("x-unit")+"' "
    });
    var txt = "Aca esto haria submit de {title: '"+$("#title").val()+"' , ingredientes: ["+ings+"] , descripción: '"+$("#descrip").val()+"' }";

    $("#temporary").html(txt);
    $("#temporary").show();
});