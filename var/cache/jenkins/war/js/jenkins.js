
// function loadScript(url, callback)
// {
//     // Adding the script tag to the head as suggested before
//     var head = document.getElementsByTagName('head')[0];
//     var script = document.createElement('script');
//     script.type = 'text/javascript';
//     script.src = url;

//     // Then bind the event to the callback function.
//     // There are several events for cross browser compatibility.
//     script.onreadystatechange = callback;
//     script.onload = callback;

//     // Fire the loading
//     head.appendChild(script);
// }

// loadScript('https://jenkins.boneal.net/branding/js/jquery-1.11.3.min.js',jquery_loaded_callback);

// function jquery_loaded_callback () {


// 	$(document).ready(function() {
// 		var jenkins_name_icon = document.getElementById("jenkins-name-icon");
// 		jenkins_name_icon.src = "branding/images/title.png";
		
// 		var jenkins_head_icon = document.getElementById("jenkins-head-icon");
// 		jenkins_head_icon.src = "branding/images/headshot.png";
// 		var head_width_height = '36px !important';
// 		jenkins_head_icon.style.width = head_width_height;
// 		jenkins_head_icon.style.minWidth = head_width_height;
// 		jenkins_head_icon.style.maxWidth = head_width_height;
// 		jenkins_head_icon.style.height = head_width_height;
// 		jenkins_head_icon.style.minHeight = head_width_height;
// 		jenkins_head_icon.style.maxHeight = head_width_height;
// 	});
// }