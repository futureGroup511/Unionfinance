function addEntry(type) {
    var str=prompt("请输入想要添加的条目");
    if(str == null) return false;
    if(str != ""){
        var data={en_name:str,en_type:type}
        $.ajax({
            url:"/Unionfinance/entry/repeat",
            data:data,
            type:'post',
            success:function(message){
                if(message == "no"){
                    $.ajax({
                        url:"/Unionfinance/entry/add",
                        data:data,
                        type:'post',
                        async:false,
                        success:function (message) {
                            alert("添加成功");
                            $("#entry").append("<option value="+"'"+message+"'"+">"+str+"</option>");
                        }
                    });

                }
                else{alert("添加条目名字重复请重新添加");}
            }
        })
    }else{
        alert("填写值不能为空");
    }
}