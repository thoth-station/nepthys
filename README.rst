Nepthys
-------

This simple bot iterates over Thoth repositories and updates documentation.

Just run ``create_docs.sh`` script, it will produce documentation for all the
libraries inside ``thoth`` directory.


Deployment
==========

The deployment of Nepthys on openshift could be done using ansible playbooks,
command to execute the playbook:

.. code-block:: console

    ansible-playbook \
    --extra-var=OCP_URL=<openshift_cluster_url> \
    --extra-var=OCP_TOKEN=<openshift_cluster_token> \
    --extra-var=NEPTHYS_APPLICATION_NAMESPACE=<openshift_cluster_project> \
    --extra-var=NEPTHYS_SSH_PRIVATE_KEY_PATH=<nepthys_git_ssh_private_key_path> \
    --extra-var=GITHUB_TOKEN=<github_oauth_token> \
    --extra-var=GITHUB_USER=<github_user> \
    --extra-var=GITHUB_USER_EMAIL=<github_user_email> \
    --extra-var=GENERIC_SECRET=<webhook_secret> \
    playbooks/provision.yaml

Note: Github oauth token must be provided as environment variable `GITHUB_TOKEN` to the script,
as `hub` requires it for authentication while generating PR.
