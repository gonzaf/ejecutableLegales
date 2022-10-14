//**********************************************************************
//Controla el ingreso de fechas.
//en el head
//<script language="javascript" src="ingresar_fechas.js"></script>
//
//en el form
//<INPUT size=11 maxLength=11 name=fecha onblur="convert_date(fecha);">
//**********************************************************************
 /*
function CPcuitValido(cuit) {
    var vec="new" Array(10);
    esCuit=false;
    cuit_rearmado="";
    errors = ''
    for (i=0; i < cuit.length; i++) {   
        caracter=cuit.charAt( i);
        if ( caracter.charCodeAt(0) >= 48 && 

caracter.charCodeAt(0) <= 57 )     {
            cuit_rearmado +=caracter;
        }
    }
    cuit=cuit_rearmado;
    if ( cuit.length != 11) {  // si to estan todos los 

digitos
        esCuit=false;
        errors = 'Cuit <11 ';
        alert( "CUIT Menor a 11 Caracteres" );
    } else {
        x=i=dv=0;
        // Multiplico los dígitos.
        vec[0] = cuit.charAt(  0) * 5;
        vec[1] = cuit.charAt(  1) * 4;
        vec[2] = cuit.charAt(  2) * 3;
        vec[3] = cuit.charAt(  3) * 2;
        vec[4] = cuit.charAt(  4) * 7;
        vec[5] = cuit.charAt(  5) * 6;
        vec[6] = cuit.charAt(  6) * 5;
        vec[7] = cuit.charAt(  7) * 4;
        vec[8] = cuit.charAt(  8) * 3;
        vec[9] = cuit.charAt(  9) * 2;
                    
        // Suma cada uno de los resultado.
        for( i = 0;i<=9; i++) {
            x += vec[i];
        }
        dv = (11 - (x % 11)) % 11;
        if ( dv == cuit.charAt( 10) ) {
            esCuit=true;
        }
    }
    if ( !esCuit ) {
        alert( "CUIT Invalido" );
        document.frmClientes.cuit.focus();
        errors = 'Cuit Invalido ';
    }
  document.MM_returnValue1 = (errors == '');
}
   */
//*******************************************************************     

function convert_date(field1)
{
var fLength = field1.value.length; // Length of supplied field in characters.
var divider_values = new Array ('-','.','/',' ',':','_',','); // Array to hold permitted date seperators.  Add in '\' value
var array_elements = 7; // Number of elements in the array - divider_values.
var day1 = new String(null); // day value holder
var month1 = new String(null); // month value holder
var year1 = new String(null); // year value holder
var divider1 = null; // divider holder
var outdate1 = null; // formatted date to send back to calling field holder
var counter1 = 0; // counter for divider looping 
var divider_holder = new Array ('0','0','0'); // array to hold positions of dividers in dates
var s = String(field1.value); // supplied date value variable

	//If field is empty do nothing
	if (fLength == 0) { return true;}

	//Find position and type of divider in the date
	for ( var i=0; i<3; i++ ) {
		for ( var x=0; x<array_elements; x++ ) {
			if ( s.indexOf(divider_values[x], counter1) != -1 ) {
				divider1 = divider_values[x];
				divider_holder[i] = s.indexOf(divider_values[x], counter1);
				counter1 = divider_holder[i] + 1;
				break;
			}
		}
	}

	//if element 2 is not 0 then more than 2 dividers have been found so date is invalid.
	if (divider_holder[2]!=0) {
		invalid_date(field1);
		return false;
	}

	//See if no dividers are present in the date string.
	if (divider_holder[0] == 0 && divider_holder[1] == 0 ) {
		switch (fLength) {
			case 3:
				//dmm
				day1 = '0' + field1.value.substring(0,1);
				month1 = field1.value.substring(1,3);
				var nYear = new Date();
				year1= String(nYear.getYear());
				break;

			case 4:
				//ddmm
				day1 = field1.value.substring(0,2);
				month1 = field1.value.substring(2,4);
				var nYear = new Date();
				year1= String(nYear.getYear());
				break;

			case 6:
				//ddmmyy
				day1 = field1.value.substring(0,2);
				month1 = field1.value.substring(2,4);
				year1 = field1.value.substring(4,6);
				if ((year1 = validate_year(year1)) == false ) {
					invalid_date(field1);
					return false;
				}
				break;

			case 8:
				//ddmmyyyy
				day1 = field1.value.substring(0,2);
				month1 = field1.value.substring(2,4);
				year1 = field1.value.substring(4,8);
				break;
		}

		if ((outdate1 = validate_date(day1,month1,year1)) == false ) {
			invalid_date(field1);
			return false;
		}

		field1.value = outdate1;
		return true;// All OK
	}

	//2 dividers are present so continue to process
	if ( divider_holder[0] != 0 && divider_holder[1] != 0 ) {
		day1 = field1.value.substring(0, divider_holder[0]);
		month1 = field1.value.substring(divider_holder[0] + 1, divider_holder[1]);
		year1 = field1.value.substring(divider_holder[1] + 1, field1.value.length);
	}

	//Check day and year are numeric
	if (isNaN(day1) && isNaN(year1)) {
		invalid_date(field1);
		return false;
	}
	
	//Make d day dd
	if (day1.length==1) {day1 = '0' + day1;}

	//Make m month mm
	if (month1.length == 1 ) { month1 = '0' + month1;}

	//Make yy year yyyy
	if (year1.length == 2) {
		if ((year1 = validate_year(year1)) == false ) {
			invalid_date(field1);
			return false;
		}
	}

	//Error mmm month
	if ( month1.length > 2) {
		invalid_date(field1);
		return false;
	}

	//Date components are OK
	if ((day1.length == 2 || month1.length == 2 || year1.length == 4) == false) {
		invalid_date(field1);
		return false;
	}

	//Validate the date
	if ((outdate1 = validate_date(day1, month1, year1)) == false ) {
		invalid_date(field1);
		return false;
	}

	// Redisplay the date in dd/mm/yyyy format
	field1.value = outdate1;
	return true;//All is well
}

//*******************************************************************
function invalid_date(inField) {
	alert("El valor ingresado " + inField.value + " no es un fecha válida.\n\r" + "Por favor utilice el formato dd/mm/aaaa o ddmm.");
	inField.focus();
	inField.select();
	return true;
}

//****************************************************************** www.simonkneafsey.co.uk
function validate_date(day2, month2, year2) {
	var DayArray = new Array(31,28,31,30,31,30,31,31,30,31,30,31);
	var inpDate = day2 + month2 + year2;
	var filter;

	//Check ddmmyyyy date supplied
	filter=/^[0-9]{2}[0-9]{2}[0-9]{4}$/;
	if (! filter.test(inpDate)) { return false;}

	//Check Valid Month
	filter=/01|02|03|04|05|06|07|08|09|10|11|12/;
	if (! filter.test(month2)) { return false;}

	/* Check for valid days for month */
	var ctr = Number(month2)-1;

	if (ctr==1) { //Febrero
		//Check año bisiesto
		var N = Number(year2);
		if ( ( N%4==0 && N%100 !=0 ) || ( N%400==0 )) { DayArray[1]=29;}
	}

	if (day2<= DayArray[ctr] && day2 >0) {
		inpDate = day2 + '/' + month2 + '/' + year2;
		return inpDate;
	} else
		return false;
}

function validate_year(inYear) {
	if (inYear < 20) {
		inYear = "20" + inYear;
		return inYear;
	}
	else if ( inYear >= 20 ) {
		inYear = "19" + inYear;
		return inYear;
	}
	else
	{
		return false;
	}
}

function fecha2YYYYMMDD(fecha) {
	return (fecha.substring(6,10) + fecha.substring(3,5) + fecha.substring(0,2));
}

function esHoraCorrecta(horaMinuto) {
	
	var hora = horaMinuto.substr(0,2);
	var minutos = horaMinuto.substr(3,2);
	var dosPuntos = horaMinuto.substr(2,1);
	if (!isNaN(hora) && !isNaN(minutos) && (dosPuntos == ':') ) {
		return true;	
	} else {
		return false;	
	}
}

function CheckTime(str)
{
	hora=str.value
	if (hora=='') {
		return
	}
	
	if (hora.length==2) {
		hora = hora + ':00';
		str.value = hora;
	}
	
	if (hora.length==1) {
		hora = '0' + hora + ':00';
		str.value = hora;
	}
	
	if (hora.length>5) {
		alert("Introdujo una cadena mayor a 5 caracteres");
		str.focus();
		str.select();
		return;
	}
	if (hora.length!=5) {
		alert("Introducir HH:MM");
		str.focus();
		str.select();
		return;
	}
	a=hora.charAt(0) //<=2
	b=hora.charAt(1) //<4
	c=hora.charAt(2) //:
	d=hora.charAt(3) //<=5
	d1=hora.charAt(4) 
	e=hora.charAt(5) //:
	f=hora.charAt(6) //<=5
	if ((a==2 && b>3) || (a>2) || (isNaN(a)) || (isNaN(b)) || (a==' ' || b==' ' )) {
		alert("El valor que introdujo en la Hora no corresponde, introduzca un digito entre 00 y 23");
		str.focus();
		str.select();
		return;
	}
	if ((d>5) || (isNaN(d)) || (isNaN(d1)) || (d==' ' || d1==' ' )) {
		alert("El valor que introdujo en los minutos no corresponde, introduzca un digito entre 00 y 59");
		str.focus();
		str.select();
		return;
	}
	if (f>5) {
		alert("El valor que introdujo en los segundos no corresponde");
		str.focus();
		str.select();
		return;
	}
	if (c!=':') {
		alert("Introduzca el caracter ':' para separar la hora y los minutos");
		str.focus();
		str.select();
		return;
	}
}


function CheckCoche(str)
{
	coche=str.value
	if (coche=='') {
		return;
	}
	if ((isNaN(coche)) || (coche==' ')) {
		alert("El valor que introdujo no es válido");
		str.focus();
		str.select();
		return;
	}
}

