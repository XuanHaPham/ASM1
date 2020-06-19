using Microsoft.WindowsAzure.Storage.Blob;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ImagesStore.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Index()
        {
            return RedirectToAction("Upload");
        }
        public ActionResult Upload()
        {
            CloudBlobContainer blobContainer = BlobStorageService.GetCloudBlobContainer();
            List<string> blobs = new List<string>();
            blobContainer.ListBlobs().ToList().ForEach(s => blobs.Add(s.Uri.ToString()));
            return View(blobs);
        }

        public Boolean checkFile(String filePath) {
            string ext = Path.GetExtension(filePath);
            if (ext.Equals(".png"))
            {
                return true;
            }
            else if (ext.Equals(".jpg"))
            {
                return true;
            }
            else
            {
                return false;
            }

        }

        [HttpPost]
        public ActionResult Upload(HttpPostedFileBase imageUpload)
        {
            if (imageUpload != null)
            {
                if (!checkFile(Path.GetFileName(imageUpload.FileName))) {
                    TempData["Msg"] = "This file is not an image.";
                    return RedirectToAction("Upload");
                }
                if (checkFile(Path.GetFileName(imageUpload.FileName)) && (imageUpload.ContentLength > 4194304))
                {
                    TempData["Msg"] = "Size of this File is greater than 4MB.";
                    return RedirectToAction("Upload");
                }
                if (checkFile(Path.GetFileName(imageUpload.FileName)) && (imageUpload.ContentLength > 0 || imageUpload.ContentLength < 4194304))
                {
                    CloudBlobContainer blobContainer = BlobStorageService.GetCloudBlobContainer();
                    CloudBlockBlob blob = blobContainer.GetBlockBlobReference(imageUpload.FileName);
                    blob.UploadFromStream(imageUpload.InputStream);
                }
            }
            else
            {           
                TempData["Msg"] = "No file is selected.";                
            }
            return RedirectToAction("Upload");
        }
        public ActionResult DeleteImage(String imageName)
        {
            Uri uri = new Uri(imageName);
            String fileName = Path.GetFileName(uri.LocalPath);
            CloudBlobContainer blobContainer = BlobStorageService.GetCloudBlobContainer();
            CloudBlockBlob blob = blobContainer.GetBlockBlobReference(fileName);
            blob.Delete();
            TempData["Msg"] = "File : " + fileName + " deleted.";
            return RedirectToAction("Upload");
        }
    }
}