<!-- ------------------------------------------------------------ ---

This file (on GitHub):

  https://github.com/mcavallo-git/cloud-infrastructure/#sync_cloud_infrastructure

--- ------------------------------------------------------------- -->

<h1 id="cloud-infrastructure">Cloud Infrastructure</h1>

<hr />

<!-- ------------------------------------------------------------ -->

<h2>Sync Shellscript Module(s) from GitHub Repo [ <a href="https://github.com/mcavallo-git/cloud-infrastructure/tree/main/">mcavallo-git/cloud-infrastructure</a> ]</h2>
<ul>
  <li>
    <h3>Prerequisite(s)</h3>
    <ul>
      <li><kbd>Debian-</kbd> or <kbd>Fedora-based</kbd> Linux distro (Ubuntu, Raspbian, CentOS, RHEL, etc.) with <kbd>sudoer</kbd> access (e.g. either running as the <kbd>root</kbd> user or as <kbd>sudoer</kbd> (a user who can masquerade as the <kbd>root</kbd> user via the <kbd>sudo</kbd> command))</li>
    </ul>
  </li>
  <li>
    <h3>Sync Shellscript Module(s)</h3>
    <ul>
      <li>
        <h4>Initial Sync</h4>
        <ul>
          <li>Run the following command in a Linux terminal:
            <ul>
              <li>
                <pre lang="shell-script">curl -sL "https://mcavallo.com/sh" | bash -s -- --all;</pre>
              </li>
              <li>
                <details>
                  <summary><span>View fallback method (run if above command returns error(s))</span></summary>
                  <ul>
                    <li>Run the following command in a Linux terminal:
                      <ul>
                        <li>
                          <pre lang="shell-script">curl -sL "https://raw.githubusercontent.com/mcavallo-git/cloud-infrastructure/main/usr/local/sbin/sync_cloud_infrastructure" | bash -s -- --all;</pre>
                        </li>
                      </ul>
                    </li>
                  </ul>
                </details>
              </li>
            </ul>
          </li>
        </ul>
      </li>
      <li>
        <h4>Manual Re-Sync/Update</h4>
        <ul>
          <li>Run the following command in a Linux terminal:
            <ul>
              <li>
                <pre lang="shell-script">sync_cloud_infrastructure;</pre>
                <ul>
                  <li>
                    <p>Note: The initial sync command may also be used to re-sync/update modules (script is idempotent)</p>
                  </li>
                </ul>
              </li>
            </ul>
          </li>
        </ul>
      </li>
    </ul>
  </li>
</ul>

<hr />
