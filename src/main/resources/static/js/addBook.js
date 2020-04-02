/**
 * 
 */

		function getSubject() {
			var branch = document.getElementById("branchName").value;
			var sem = document.getElementById("semester").value;
			var sub = document.getElementById("subject");
			
			var htp=new XMLHttpRequest();
			htp.onreadystatechange=function(){
				if(htp.readyState==4){
					sub.innerHTML="";
					var opn = document.createElement("option");
					opn.text = "-- Select --";
					opn.value = " ";
					sub.options.add(opn);
					var data = JSON.parse(htp.responseText);
					for (var i = 0; i < data.length; i++) {
						
						var subjectId = data[i].subjectId;
						var subjectCode = data[i].subjectCode;
						var subjectName = data[i].subjectName;
						
						var opn = document.createElement("option");
						
						opn.text = subjectName;
						opn.value = subjectId+"_"+subjectCode;
						
						sub.options.add(opn);
					}
				}
			}
			htp.open("get","/getSubject?branch="+branch+"&sem="+sem,true);
			htp.send();
		}
		
		function setSubject() {
			var subject = document.getElementById("subject").value.split("_");
			document.getElementById("subjectId").value = subject[0];
			document.getElementById("subjectCode").value = subject[1];
		}
		
		function showFrontImage() {
			var src = document.getElementById("front");
			var target = document.getElementById("f");
			var fr=new FileReader();
			fr.onload = function(e) { 
				target.src = e.target.result;
			};
			fr.readAsDataURL(src.files[0]);
		}
		
		function showBackImage() {
			var src = document.getElementById("back");
			var target = document.getElementById("b");
			var fr=new FileReader();
			fr.onload = function(e) { 
				target.src = e.target.result;
			};
			fr.readAsDataURL(src.files[0]);
		}