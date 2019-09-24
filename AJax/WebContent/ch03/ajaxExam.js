var xhr = null;
function startMethod(){
	xhr = new XMLHttpRequest();
	xhr.onreadystatechange = resultProcess;
	xhr.open("GET", "ajaxExam.xml", true);
	xhr.send(null);
}

function resultProcess(){
	if(xhr.readyState==4){
		if(xhr.status==200){
			processXML();
		}
	}
		
}

function processXML () {
	var trChild = document.getElementById("resultDisplay").childNodes;
	var size = trChild.length;
	alert(trChild.length);
	for(var i=trChild.length-1; i>=0; i--){
		trChild[i].remove();
	}
	
	
	//if(trChild.length>0) return false;
	
	var xmlDoc = xhr.responseXML;
	var trTag;
	var tdTag;
	
	var subjects = xmlDoc.getElementsByTagName("subject");
	for(var i=0; i<subjects.length; i++){
		trTag = document.createElement("tr");
		
		var childs = subjects[i].childNodes;
		for(var j=0; j<childs.length; j++){
			if(childs[j].firstChild != null){
				tdTag = document.createElement("td");
				
				var text = childs[j].firstChild;
				tdTag.appendChild(text);
				trTag.appendChild(tdTag);
			}
		}//for j
		document.getElementById("resultDisplay").appendChild(trTag);
	}//for i
	
	
}