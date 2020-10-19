
$("#ApartNumber").hide();
$("#NumberBusiness").hide();
$("#NumberFloor").hide();
$("#BasementNumber").hide();
$("#NumberParking").hide();
$("#Numbercage").hide();
$("#Occupantperfloors").hide();
$("#NumberHour").hide();
$("#RecommendedNumber").hide();
$("#type").hide();
$("#Elevatorcost").hide();
$("#Totalelevatorcost").hide();
$("#Totalinstal").hide();
$("#Fulltotal").hide();




$('#BuildingType').on('change', function () {
    var TypeValue = $("#BuildingType option:selected").val();
   
   if(TypeValue == "Residential"){
                $("#ApartNumber").show();
                $("#NumberFloor").show();
                $("#BasementNumber").show();
                $("#NumberBusiness").hide();
                $("#NumberParking").hide();
                $("#Numbercage").hide();
                $("#Occupantperfloors").hide();
                $("#NumberHour").hide();
                $("#RecommendedNumber").show();
                $("#type").show();
                $("#Elevatorcost").show();
                $("#Totalelevatorcost").show();
                $("#Totalinstal").show();
                $("#Fulltotal").show();

           };
   if(TypeValue=="Commercial"){
                $("#ApartNumber").hide();
                $("#NumberFloor").show();
                $("#BasementNumber").show();
                $("#NumberBusiness").show();
                $("#NumberParking").show();
                $("#Numbercage").show();
                $("#NumberHour").hide();
                $("#Occupantperfloors").hide();
                $("#RecommendedNumber").show();
                $("#type").show();
                $("#Elevatorcost").show();
                $("#Totalelevatorcost").show();
                $("#Totalinstal").show();
                $("#Fulltotal").show();     

               };
   if(TypeValue=="Corporate"){
                $("#ApartNumber").hide();
                $("#NumberFloor").show();
                $("#BasementNumber").show();
                $("#NumberBusiness").show();
                $("#NumberParking").show();
                $("#Occupantperfloors").show();
                $("#Numbercage").hide();
                $("#NumberHour").hide();
                $("#RecommendedNumber").show();
                $("#type").show();
                $("#Elevatorcost").show();
                $("#Totalelevatorcost").show();
                $("#Totalinstal").show();
                $("#Fulltotal").show();

           };
   if(TypeValue == "Hybrid"){
                $("#ApartNumber").hide();
                $("#NumberFloor").show();
                $("#BasementNumber").show();
                $("#NumberBusiness").show();
                $("#NumberParking").show();
                $("#Numbercage").hide();
                $("#Occupantperfloors").show();
                $("#NumberHour").show();
                $("#RecommendedNumber").show();
                $("#type").show();
                $("#Elevatorcost").show();
                $("#Totalelevatorcost").show();
                $("#Totalinstal").show();
                $("#Fulltotal").show();

           };
   if(TypeValue == ""){
                $("#ApartNumber").hide();
                $("#NumberBusiness").hide();
                $("#NumberFloor").hide();
                $("#BasementNumber").hide();
                $("#NumberParking").hide();
                $("#Numbercage").hide();
                $("#Occupantperfloors").hide();
                $("#NumberHour").hide();
                $("#RecommendedNumber").hide();
                $("#type").hide();
                $("#Elevatorcost").hide();
                $("#Totalelevatorcost").hide();
                $("#Totalinstal").hide();
                $("#Fulltotal").hide();
           
           };
 
   
});

    var ApartNumber = document.getElementById('Number_Appart');
    var NumberBusiness = document.getElementById('Number_Business');
    var NumberFloor = document.getElementById('Number_Floor');
    var BasementNumber = document.getElementById('Basement_Number');
    var NumberParking = document.getElementById('NumberParking'); 
    var Numbercage = document.getElementById('Number_cages');
    var Occupantperfloors = document.getElementById('Occupant_per_floors'); 
    var NumberHour = document.getElementById('Number_Hour');
    var RecommendedNumber = document.getElementById('Recommended_Number');
    var type = document.getElementById('type'); 
    var Elevatorcost = document.getElementById('Elevator_cost');
    var Totalelevatorcost = document.getElementById('Total_elevator_cost');
    var Totalinstal = document.getElementById('Total_instal'); 
    var Fulltotal = document.getElementById('Full_total');  


function commercial(){
    RecommendedNumber.value = Numbercage.value
};

function residential(){
    var apart_floors = ApartNumber.value / NumberFloor.value;
    console.log(apart_floors + "apart_floors");
    var Number_elevator = Math.ceil(apart_floors / 6);
    console.log(Number_elevator + "Number_elevator");
    var col = Math.ceil(NumberFloor.value / 20);
    console.log(col + "col");
    var rec_elevator = col * Number_elevator;
    console.log(rec_elevator + "rec_elevator");
    RecommendedNumber.value = rec_elevator;
};


function cor_hyb(){
    var total_Floors = parseInt(NumberFloor.value) + parseInt(BasementNumber.value);
    console.log(total_Floors + " total_Floors");
    var totalPersonnes =  Occupantperfloors.value * total_Floors;
    console.log(totalPersonnes + " totalPersonnes");
    var Number_elevator = Math.ceil(totalPersonnes / 1000);
    console.log(Number_elevator + " Number_elevator");
    var number_colone = Math.ceil(total_Floors / 20);
    console.log(number_colone + " number_colone");
    var elevator_per_colone = Math.ceil(Number_elevator / number_colone);
    console.log(elevator_per_colone + " elevator_per_colone");
    var total =  elevator_per_colone * number_colone;
    console.log(total + " total");
    RecommendedNumber.value = total;
}; 


$("input[type='radio']").on('click', function(){
    var type = $("input[name='Typeradio']:checked").val();
    if(type == "7565"){
        Elevatorcost.value = type;
        Totalelevatorcost.value = Elevatorcost.value * RecommendedNumber.value;
        var intstal = Totalelevatorcost.value * 0.10;
        Totalinstal.value = intstal;
        Fulltotal.value = (parseInt(Totalinstal.value) + parseInt(Totalelevatorcost.value)).toFixed(2);
        }

    if(type == "12345"){
        Elevatorcost.value = type;
        Totalelevatorcost.value = Elevatorcost.value * RecommendedNumber.value;
        var intstal = Totalelevatorcost.value * 0.13;
        Totalinstal.value = intstal;
        Totalinstal.value = intstal;
        Fulltotal.value = (parseInt(Totalinstal.value) + parseInt(Totalelevatorcost.value)).toFixed(2);
        }
    if(type == "15400"){
        Elevatorcost.value = type;
        Totalelevatorcost.value = parseInt(Elevatorcost.value) * parseInt(RecommendedNumber.value);
        var intstal = Totalelevatorcost.value * 0.16;
        Totalinstal.value = intstal;
        Totalinstal.value = intstal;
        Fulltotal.value = (parseInt(Totalinstal.value) + parseInt(Totalelevatorcost.value)).toFixed(2);
    }
    });

$("input").on('keyup click',function () {
    var TypeValue = $("#BuildingType option:selected").val();
   
   if(TypeValue=="Residential"){
    residential();
    
   }

   if(TypeValue=="Commercial"){
    commercial();
    
          
   }
   if(TypeValue=="Corporate"){
    cor_hyb();
         
   }

   if(TypeValue=="Hybrid"){
    cor_hyb();
   
   }
  
});
