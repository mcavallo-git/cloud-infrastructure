<!--  [View this file Online]  https://github.com/mcavallo-git/cloud-infrastructure/blob/master/README.md  -->

<h3>Cloud Infrastructure</h3>

<!-- ------------------------------------------------------------ -->

<details><summary>
		<strong>Sync-Repo</strong>
		<sub><i> → Syncs git repository & all runtime shellscripts</i></sub>
	</summary>
	<br />
	<ol>
	<li>Download and run the cloud-sync shellscript from the git-repo by calling:<br />
	<pre><code>
REPO_FILE="https://raw.githubusercontent.com/mcavallo-git/cloud-infrastructure/master/usr/local/sbin/sync_cloud_infrastructure" && LOCAL_FILE="${HOME}/sync_cloud_infrastructure" && wget "${REPO_FILE}" --output-document="${LOCAL_FILE}" && chmod 0700 "${LOCAL_FILE}" && ${LOCAL_FILE} --cron sync && rm "${LOCAL_FILE}";
	</code></pre>
	</li>
	</ol>
</details>
<hr />

<hr /><!-- ------------------------------------------------------------ -->

<details>
	<summary>Linux Filesystem Hierarchy</summary>
	<pre><code><a href="usr/local/share/man/hier.man">man hier; # hier - description of the filesystem hierarchy</a></pre></code>
</details>

<hr /><!-- ------------------------------------------------------------ -->

<details>
	<summary>Citation(s)</summary>
	<pre><code>
		<ul>
			<li><h4><a href="https://linux.die.net/man/7/hier">hier(7) - Linux man page</a></h4></li>
			<li><h4><a href="https://en.wikipedia.org/wiki/Filesystem_Hierarchy_Standard">Filesystem Hierarchy Standard (FHS)</a></h4></li>
		</ul>
	</pre></code>
</details>
