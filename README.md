## OneNote API Class Notebooks Transfer PowerShell Sample README

Created by Microsoft Corporation, 2016. Provided as-is without warranty. Trademarks mentioned here are the property of their owners.

### API functionality demonstrated in this sample

The following aspects of the API are covered in this sample. 

* Obtain an access token using Azure PowerShell
* POST a Class Notebook Transfer

### Prerequisites

* [Azure PowerShell](https://azure.microsoft.com/en-us/documentation/articles/powershell-install-configure) - used to obtain an access token to talk to the OneNote Class Notebooks API.
* [Two Office 365 account with OneDrive set up](https://portal.office.com) - This sample will transfer a notebook located on a teacher's OneDrive and transfer it to the other teacher's OneDrive. To ensure that your OneDrive is set up, log on to [Office 365](https://portal.office.com) and click the blue "OneDrive" icon in the app launcher. If you are taken to your OneDrive, you are all set.
* IT Admin with permissions on both teacher's OneDrive [See guide](http://www.sharepointdiary.com/2015/08/sharepoint-online-add-site-collection-administrator-using-powershell.html)
* One Class Notebook created using our [OneNote Class Notebooks API](https://github.com/OneNoteDev/OneNoteClassNotebookAPISamplePowerShell) - this is the notebook the sample will transfer between the teachers.

### Using the sample

1. Obtain a client ID as described under [Authenticate using Azure AD (enterprise apps)](https://msdn.microsoft.com/office/office365/howto/onenote-auth#aad-auth). When asked for a redirect URI, "http://localhost" will suffice:

  ![Image of redirect URI](http://i.imgur.com/wfsOClm.png)

  When asked for OneNote delegated permissions, check the following:

  ![Image of permissions](http://i.imgur.com/adTLghg.png)

2. Download this repo as a ZIP file to your local computer, and extract the files. Or, clone the repository into a local copy of Git.

3. Edit OneNoteClassNotebooksApiSample.ps1. Find and replace the following tokens with real values:
   * &lt;AZURE_AD_TENANT_NAME&gt; - This is your Azure tenant, e.g. "contoso.com".
   * &lt;CLIENT_ID&gt; - This is the client ID of your app, e.g. "471afe29-4aee-4bc5-9aaf-468ee5bbe20a".
   * &lt;MY_ADMIN_LOGIN&gt; - This is your IT Admin Office 365 login name.
   * &lt;MY_ADMIN_PASSWORD&gt; - This is your IT Admin Office 365 password.
   * &lt;NOTEBOOK_ID&gt; - This is the Id of the notebook to be transfered.
   * &lt;SOURCE_TEACHER_ID&gt; - This is the login name of the teacher that owns the notebook.
   * &lt;DESTINATION_TEACHER_ID&gt; - This is the login name of the teacher that will receive the notebook.

4. Once all the placeholders above have been replaced with real values (remember to enclose each value in double quotes), simply execute the script.

5. Once the script has successfully executed, you will receive a string containing the correlation number. Please keep this as it may help us investigate if there is any issue with the transfer.

6. Go to the destination teacher OneDrive where you will see a folder named "Class Notebooks". In this folder you will find the class notebook the script transfered from the source's teacher. This process may take a few minutes.

### Version info

This is the initial public release for this code sample.

### Learning more

* Learn about [OneNote Class Notebooks](https://www.onenote.com/classnotebook)
* Learn about the [OneNote Class Notebooks API](https://msdn.microsoft.com/office/office365/howto/onenote-classnotebook)
* Visit the [dev.onenote.com](http://dev.onenote.com) Dev Center
* Contact us at [onenoteedu@microsoft.com](mailto:onenoteedu@microsoft.com)
* Follow us on [Twitter @onenotedev](http://www.twitter.com/onenotedev)
* Read our [OneNote Developer blog](http://go.microsoft.com/fwlink/?LinkID=390183)
* [Debugging / Troubleshooting](http://msdn.microsoft.com/EN-US/library/office/dn575430.aspx)
