function llenar_pago() {
    var tipo_pago = $("#id_tipo_pago").val();
    if (tipo_pago <= "2") {
        $("#campos").show();
    } else {
        $("#campos").hide();
    }
}

function agregar_ccnu_acc(button) {
	var row = button.parentNode.parentNode;
  	var cells = row.querySelectorAll('td:not(:last-of-type)');
  	agregar_ccnu_accToCartTable(cells);
	//$("#dia").val($("#dia").data("default-value"));

}

function remove_proy_acc() { 
	var row = this.parentNode.parentNode;
    document.querySelector('#target_req_acc tbody').removeChild(row);
	$("#tarifa").val($("#tarifa").data("default-value"));	

	var id_alicuota_iva = $("#id_alicuota_iva").val();
	let explode = id_alicuota_iva.split('/');
    let monto_iva = explode[0];


	var sub_total_restar = row.getElementsByTagName("td")[5].children[0].value;
	var newstr = sub_total_restar.replace('.', "");
	var newstr2 = newstr.replace('.', "");
	var newstr3 = newstr2.replace('.', "");
	var newstr4 = newstr3.replace('.', "");
	var iva_estimado = newstr4.replace(',', ".");

	var total_ivas = $("#total_iva").val();
	var newstr = total_ivas.replace('.', "");
	var newstr2 = newstr.replace('.', "");
	var newstr3 = newstr2.replace('.', "");
	var newstr4 = newstr3.replace('.', "");
	var total_iva = newstr4.replace(',', ".");

	let monto_restar = iva_estimado * monto_iva;

	var total_f_1 = Number(total_iva) + Number(monto_restar);
	var total_f_2 = parseFloat(total_f_1).toFixed(2);
	var total_f = Intl.NumberFormat("de-DE").format(total_f_2);
	$('#total_iva').val(total_f);

	var monto_restar_t = row.getElementsByTagName("td")[6].children[0].value;
	var newstr = monto_restar_t.replace('.', "");
	var newstr2 = newstr.replace('.', "");
	var newstr3 = newstr2.replace('.', "");
	var newstr4 = newstr3.replace('.', "");
	var restar_monto = newstr4.replace(',', ".");

	var tl_mas_iva = $("#total_mas_iva").val();
	var newstr = tl_mas_iva.replace('.', "");
	var newstr2 = newstr.replace('.', "");
	var newstr3 = newstr2.replace('.', "");
	var newstr4 = newstr3.replace('.', "");
	var tol_mas_iva = newstr4.replace(',', ".");

	var total_ivas = Number(tol_mas_iva) + Number(restar_monto);
	var total_ivass = parseFloat(total_ivas).toFixed(2);
	var total_f = Intl.NumberFormat("de-DE").format(total_ivass);
	$('#total_mas_iva').val(total_f);


	var total_bss = $("#total_bs").val();
	var newstr = total_bss.replace('.', "");
	var newstr2 = newstr.replace('.', "");
	var newstr3 = newstr2.replace('.', "");
	var newstr4 = newstr3.replace('.', "");
	var total_bs = newstr4.replace(',', ".");

	var dolars = $("#dolar").val();


	var total_bs_restar = Number(monto_restar_t) * Number(dolars);
	console.log(total_bs_restar);
	var total_bs = total_bs - total_bs_restar;
	console.log(total_bs);
	var total_bss = parseFloat(total_bs).toFixed(2);
	var total_bsss = Intl.NumberFormat("de-DE").format(total_bss);
	$('#total_bs').val(total_bsss); 

}

function agregar_ccnu_accToCartTable(cells){
	var pies = $("#pies").val();
	var tarifas = $("#tarifa").val();
	let explode = tarifas.split('/');
    let id_producto = explode[0];
    let cot_u = explode[1];
    let code = explode[2];
    let desct = explode[3];

 	var sub_t = $("#sub_t").val();
	 var descuet = $('#desc').val();
	 var separar = descuet.split("/");
	 var porcentaje = parseFloat(separar['1']);
	 var id_des = parseFloat(separar['2']);
 	var t_desc = $("#t_desc").val();
	 
 	var desc1 = $("#desc1").val();
 	var code1 = $("#code1").val();

	var canon = $("#canon").val();



    var matricular = $("#cedula").val();
    // var ob = $("#ob").val();
    // var monto_estimado = $("#monto_estimado").val();

	if (pies == '' || tarifa == '' || matricular == ''  ){

		if (pies== '') {
			document.getElementById("pies").focus();
		}
		else if (tarifa =='') {
			document.getElementById("tarifa").focus();
		}
		else if (matricular == '') {
			document.getElementById("matricular").focus();
		}
		
	}else{
		var newRow = document.createElement('tr');
		var increment = increment +1;
		newRow.className='myTr';
		newRow.innerHTML = `
       	<td>${matricular}<input type="hidden" name="matricularr[]" id="ins-subtype-${increment}" hidden value="${matricular}"></td>
		   <td>${code1}<input type="text" name="code1[]" id="ins-type-${increment}" hidden value="${code1}"></td>
		<td>${desc1}<input type="text" name="desc1[]" id="ins-type-${increment}" hidden value="${desc1}"></td>
		<td>${pies}<input type="text" name="pies[]" id="ins-type-${increment}" hidden value="${pies}"></td>
		<td>${cot_u}<input type="text" name="cot_u[]" id="ins-subtype-${increment}" hidden value="${cot_u}"></td>
        <td>${sub_t}<input type="text" name="sub_t[]" id="ins-subtype-${increment}" hidden value="${sub_t}"></td>
        <td>${id_des}<input type="text" name="id_des[]" id="ins-subtype-${increment}" hidden value="${id_des}"></td>
        <td>${t_desc}<input type="text" name="t_desc[]" id="ins-subtype-${increment}" hidden value="${t_desc}"></td>        
		<td>${canon}<input type="text" name="canon[]" id="ins-subtype-${increment}" hidden value="${canon}"></td>
		`;


	  
	    var iva_estimado = 0;

		
	    var total_iva = 0;

		var total_f_1 = Number(iva_estimado) + Number(total_iva);
		var total_f_2 = parseFloat(total_f_1).toFixed(2);
	    var total_f = Intl.NumberFormat("de-DE").format(total_f_2);
		$('#total_iva').val(total_f);

		var tl_mas_iva = $("#total_mas_iva").val();
		var newstr = tl_mas_iva.replace('.', "");
	    var newstr2 = newstr.replace('.', "");
	    var newstr3 = newstr2.replace('.', "");
	    var newstr4 = newstr3.replace('.', "");
	    var tol_mas_iva = newstr4.replace(',', ".");

		var canons = $("#canon").val();
		var newstr = canons.replace('.', "");
	    var newstr2 = newstr.replace('.', "");
	    var newstr3 = newstr2.replace('.', "");
	    var newstr4 = newstr3.replace('.', "");
	    var canon = newstr4.replace(',', ".");

		var monto_iva = 0;
		

		let monto_sumar = canon * monto_iva;	

		var total_mas_ivas = Number(tol_mas_iva) + (Number(canon) + Number(monto_sumar));
		var total_mas_ivass = parseFloat(total_mas_ivas).toFixed(2);
	    var total_mas_iva = Intl.NumberFormat("de-DE").format(total_mas_ivass);
		$('#total_mas_iva').val(total_mas_iva);

		// var dolars = $("#dolar").val();


		// var total_bs = (Number(tol_mas_iva) + (Number(canon) + Number(monto_sumar))) * Number(dolars);
		// var total_bss = parseFloat(total_bs).toFixed(2);
	    // var total_bsss = Intl.NumberFormat("de-DE").format(total_bss);
		// $('#total_bs').val(total_bsss);


		var cellremove_proy_accBtn = createCell();
		cellremove_proy_accBtn.appendChild(createremove_proy_accBtn())
		newRow.appendChild(cellremove_proy_accBtn);
		document.querySelector('#target_req_acc tbody').appendChild(newRow);
		$("#pies").val($("#pies").data("default-value"));
		$("#tarifa").val($("#tarifa").data("default-value"));

		$("#sub_t").val('');
		$("#desc").val('');
		
		$("#t_desc").val('');
		$("#costo_u").val('');

       $("#canon").val('');
        $("#monto_estimado").val('');
		$("#btn_guar_2").prop('disabled', false);
	}
}

function createremove_proy_accBtn() {
    var btnremove_proy_acc = document.createElement('button');
    btnremove_proy_acc.className = 'btn btn-xs btn-danger';
    btnremove_proy_acc.onclick = remove_proy_acc;
    btnremove_proy_acc.innerText = 'Descartar';
    return btnremove_proy_acc;
}

function createCell(text) {
	var td = document.createElement('td');
  if(text) {
  	td.innerText = text;
  }
  return td;
}
