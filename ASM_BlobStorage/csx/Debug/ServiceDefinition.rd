<?xml version="1.0" encoding="utf-8"?>
<serviceModel xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" name="ASM_BlobStorage" generation="1" functional="0" release="0" Id="51c82539-9f07-426d-9c82-1739d66eec31" dslVersion="1.2.0.0" xmlns="http://schemas.microsoft.com/dsltools/RDSM">
  <groups>
    <group name="ASM_BlobStorageGroup" generation="1" functional="0" release="0">
      <componentports>
        <inPort name="ImagesStore:Endpoint1" protocol="http">
          <inToChannel>
            <lBChannelMoniker name="/ASM_BlobStorage/ASM_BlobStorageGroup/LB:ImagesStore:Endpoint1" />
          </inToChannel>
        </inPort>
      </componentports>
      <settings>
        <aCS name="ImagesStore:ImageStorageAccountConn" defaultValue="">
          <maps>
            <mapMoniker name="/ASM_BlobStorage/ASM_BlobStorageGroup/MapImagesStore:ImageStorageAccountConn" />
          </maps>
        </aCS>
        <aCS name="ImagesStore:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/ASM_BlobStorage/ASM_BlobStorageGroup/MapImagesStore:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </maps>
        </aCS>
        <aCS name="ImagesStoreInstances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/ASM_BlobStorage/ASM_BlobStorageGroup/MapImagesStoreInstances" />
          </maps>
        </aCS>
      </settings>
      <channels>
        <lBChannel name="LB:ImagesStore:Endpoint1">
          <toPorts>
            <inPortMoniker name="/ASM_BlobStorage/ASM_BlobStorageGroup/ImagesStore/Endpoint1" />
          </toPorts>
        </lBChannel>
      </channels>
      <maps>
        <map name="MapImagesStore:ImageStorageAccountConn" kind="Identity">
          <setting>
            <aCSMoniker name="/ASM_BlobStorage/ASM_BlobStorageGroup/ImagesStore/ImageStorageAccountConn" />
          </setting>
        </map>
        <map name="MapImagesStore:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/ASM_BlobStorage/ASM_BlobStorageGroup/ImagesStore/Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </setting>
        </map>
        <map name="MapImagesStoreInstances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/ASM_BlobStorage/ASM_BlobStorageGroup/ImagesStoreInstances" />
          </setting>
        </map>
      </maps>
      <components>
        <groupHascomponents>
          <role name="ImagesStore" generation="1" functional="0" release="0" software="C:\Users\Ha\Desktop\ASM_BlobStorage\ASM_BlobStorage\csx\Debug\roles\ImagesStore" entryPoint="base\x64\WaHostBootstrapper.exe" parameters="base\x64\WaIISHost.exe " memIndex="-1" hostingEnvironment="frontendadmin" hostingEnvironmentVersion="2">
            <componentports>
              <inPort name="Endpoint1" protocol="http" portRanges="80" />
            </componentports>
            <settings>
              <aCS name="ImageStorageAccountConn" defaultValue="" />
              <aCS name="Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="" />
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;ImagesStore&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;ImagesStore&quot;&gt;&lt;e name=&quot;Endpoint1&quot; /&gt;&lt;/r&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/ASM_BlobStorage/ASM_BlobStorageGroup/ImagesStoreInstances" />
            <sCSPolicyUpdateDomainMoniker name="/ASM_BlobStorage/ASM_BlobStorageGroup/ImagesStoreUpgradeDomains" />
            <sCSPolicyFaultDomainMoniker name="/ASM_BlobStorage/ASM_BlobStorageGroup/ImagesStoreFaultDomains" />
          </sCSPolicy>
        </groupHascomponents>
      </components>
      <sCSPolicy>
        <sCSPolicyUpdateDomain name="ImagesStoreUpgradeDomains" defaultPolicy="[5,5,5]" />
        <sCSPolicyFaultDomain name="ImagesStoreFaultDomains" defaultPolicy="[2,2,2]" />
        <sCSPolicyID name="ImagesStoreInstances" defaultPolicy="[1,1,1]" />
      </sCSPolicy>
    </group>
  </groups>
  <implements>
    <implementation Id="a90d1497-876c-43aa-b240-176363f91d5a" ref="Microsoft.RedDog.Contract\ServiceContract\ASM_BlobStorageContract@ServiceDefinition">
      <interfacereferences>
        <interfaceReference Id="048b41e9-71b4-463b-a3fd-68030e3c902d" ref="Microsoft.RedDog.Contract\Interface\ImagesStore:Endpoint1@ServiceDefinition">
          <inPort>
            <inPortMoniker name="/ASM_BlobStorage/ASM_BlobStorageGroup/ImagesStore:Endpoint1" />
          </inPort>
        </interfaceReference>
      </interfacereferences>
    </implementation>
  </implements>
</serviceModel>