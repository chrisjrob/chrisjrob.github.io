## Webcam

<<<---
%RAW%
<IMG src="images/webcam/webcam.jpg" width="640" height="480" border="1" name="webcam">
<script type="text/javascript">
function refreshCam(){
  document.images.webcam.src='images/webcam/webcam.jpg?'+new Date().getTime();
  setTimeout('refreshCam()',10000);
}
if (document.images) refreshCam();
</script>
%RAW%
   Updated every 12 seconds
<<<---