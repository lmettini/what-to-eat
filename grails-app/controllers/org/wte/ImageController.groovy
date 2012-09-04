package org.wte

import grails.plugins.springsecurity.Secured

class ImageController {

    def imageShackUploaderService
    def springSecurityService

    def uploader = {
    }

	@Secured(['IS_AUTHENTICATED_FULLY'])
    def postImage = {
        def reqfile = request.getFile('photoimg')

        def bytesReqFile = reqfile.getBytes();
        if(bytesReqFile.size()>(3*1024*1024)){
            render("<script>parent.alertImgMessage('La imagen no debe superar los 3MB.')</script>")
            return
        }
        if(reqfile.fileItem.contentType.indexOf("image/")==-1){
            render("<script>parent.alertImgMessage('Formato de archivo no valido.')</script>")
            return
        }

        try {
            def user = springSecurityService.currentUser
            def file = File.createTempFile(reqfile.fileItem.fileName,"")
            FileOutputStream out = new FileOutputStream(file)
            out.write(bytesReqFile)
            out.close()
            def thumb = imageShackUploaderService.uploadImage(file,"90x90",reqfile.getContentType())
            def medium = imageShackUploaderService.uploadImage(file,"426x320",reqfile.getContentType())
            def img = new Image(thumbnail: thumb,medium: medium,creator: user)
            img.save(flush:true)
            render("<script>parent.addImageInsideModal({id:'${img.id}',thumbnail:'${img.thumbnail}',medium:'${img.medium}'})</script>")
        } catch (e) {
            e.printStackTrace()
            render("<script>parent.alertImgMessage('Ha ocurrido un error, vuelva a intentar.')</script>")
        }


    }


}
