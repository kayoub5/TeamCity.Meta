<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  ~ Copyright 2000-2014 Eugene Petrenko
  ~
  ~ Licensed under the Apache License, Version 2.0 (the "License");
  ~ you may not use this file except in compliance with the License.
  ~ You may obtain a copy of the License at
  ~
  ~ http://www.apache.org/licenses/LICENSE-2.0
  ~
  ~ Unless required by applicable law or agreed to in writing, software
  ~ distributed under the License is distributed on an "AS IS" BASIS,
  ~ WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  ~ See the License for the specific language governing permissions and
  ~ limitations under the License.
  --%>
<%@include file="/include-internal.jsp"%>
<jsp:useBean id="metaListPath" type="java.lang.String" scope="request"/>

<div class="jonnyzzzMetaInstaller" style="padding-top: 2em;">
  <h2 class="noBorder">Install Meta-Runners</h2>

  <c:set var="repo" value="https://github.com/JetBrains/meta-runner-power-pack"/>
  <div class="" style="height: 2em">
    <div id="jonnyzzzMetaInstallerContainer-Times" class="smallNote" style="display: inline-block; margin-right: 1em; float: right;">
      downloaded <div class="jonnyzzzMetaInstallerContainer-downloadedSince" style="display: inline-block; margin-right: 1em"></div>
      <a href="#" class="btn jonnyzzzMetaInstallerReset">Reload</a>
    </div>
    <span>
    Select Meta-Runner to install from <a href="${repo}" target="_blank">${repo}</a>
    </span>
  </div>

  <div id="jonnyzzzMetaInstallerContainer">
  </div>

  <div id="jonnyzzzMetaInstallerContainerProgress">
    <div style='width: 30em'>
      <forms:progressRing style="float:none"/>
      <span>Fetching meta-runners from the repo...</span>
    </div>
  </div>

  <script type="text/javascript">
    $j(function(){
      var loadContainer = function(reset) {
        $j("#jonnyzzzMetaInstallerContainer-Times").hide();
        $j(".jonnyzzzMetaInstallerContainer-downloadedSince").html("");
        $j("#jonnyzzzMetaInstallerContainerProgress").show();
        $j("#jonnyzzzMetaInstallerContainer").hide();

        <c:url var="metaListUrl" value="${metaListPath}"/>
        var ajaxUrl = "<bs:forJs>${metaListUrl}</bs:forJs>";
        if (reset) {
          ajaxUrl += "&reset=1";
        }
        BS.ajaxUpdater($("jonnyzzzMetaInstallerContainer"), ajaxUrl, {
          method: "GET",
          evalScripts: true,
          onComplete: function () {
            $j("#jonnyzzzMetaInstallerContainerProgress").hide();
            $j("#jonnyzzzMetaInstallerContainer").show();
            $j("#jonnyzzzMetaInstallerContainer-Times").show();
          }
        });
      };

      $j("a.jonnyzzzMetaInstallerReset").click(function() {
        loadContainer("reset");
        return false;
      });

      loadContainer();
    });
  </script>
</div>
