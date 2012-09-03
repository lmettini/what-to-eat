package what.to.eat

import org.apache.http.HeaderIterator;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.ParseException;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.mime.FormBodyPart;
import org.apache.http.entity.mime.HttpMultipartMode;
import org.apache.http.entity.mime.MIME;
import org.apache.http.entity.mime.MultipartEntity;
import org.apache.http.entity.mime.content.FileBody;
import org.apache.http.entity.mime.content.StringBody;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;

class ImageShackUploaderService {

    static transactional = true

    def uploadImage(file,size,contentType) {

        def imgUrl = ""

        HttpClient httpclient = new DefaultHttpClient();
        HttpPost post = new HttpPost("http://www.imageshack.us/upload_api.php");


        MultipartEntity entity = new MultipartEntity( HttpMultipartMode.BROWSER_COMPATIBLE, null, null);

        FormBodyPart fbp = new FormBodyPart("fileupload", new FileBody(file, contentType));
        entity.addPart(fbp);


        FormBodyPart fbp2 = new FormBodyPart("key", new StringBody("26IJLPQT5df3b3791147255e13e56ace21c46121", MIME.DEFAULT_CHARSET));
        entity.addPart(fbp2);

        FormBodyPart fbp3 = new FormBodyPart("optimage", new StringBody("1", MIME.DEFAULT_CHARSET));
        entity.addPart(fbp3);

        FormBodyPart fbp4 = new FormBodyPart("optsize", new StringBody(size, MIME.DEFAULT_CHARSET));
        entity.addPart(fbp4);
        post.setEntity(entity);
        post.addHeader("User-Agent", "Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2.6) Gecko/20100625 Firefox/3.6.6");
        post.addHeader("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8");
        post.addHeader("Accept-Language", "en-us,en;q=0.5");
        //post.addHeader("Accept-Encoding",  "gzip,deflate");
        post.addHeader("Accept-Charset", "ISO-8859-1,utf-8;q=0.7,*;q=0.7");
        post.addHeader("Keep-Alive", "115");
        post.addHeader("Connection", "keep-alive");

        //System.out.println(post.getRequestLine());
        HeaderIterator hiter = post.headerIterator();
        while(hiter.hasNext()) {
                //System.out.println(hiter.next());
                hiter.next()
        }
        //System.out.println(entity.getContentEncoding());
        //System.out.println(entity.getContentType());
        //System.out.println(entity.getContentLength() + "");
        try {

                entity.writeTo(System.out);
        } catch (IOException e1) {
                // TODO Auto-generated catch block
                e1.printStackTrace();
        }
        //System.out.println(fbp.getHeader());
        //System.out.println(fbp2.getHeader());

        try {
                HttpResponse httpresponse = httpclient.execute( post );
                for(int i = 0; i < httpresponse.getAllHeaders().length; i++) {
                        org.apache.http.Header hd = httpresponse.getAllHeaders()[i];
                        //System.out.println(hd);
                }


                String response = EntityUtils.toString( httpresponse.getEntity(), "UTF-8"  );
                HttpEntity resEntity = httpresponse.getEntity();

                resEntity.consumeContent();

                def xmlResp = new XmlParser().parseText(response)

                imgUrl = xmlResp.links.image_link[0].text()

        } catch (ParseException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
        } catch (ClientProtocolException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
        } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
        } finally {
                httpclient.getConnectionManager().shutdown();
        }

        return imgUrl

    }
}
