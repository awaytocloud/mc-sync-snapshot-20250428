# mc-sync

This is a simple data transfer/sync program based on the MinIO Client utilities (https://github.com/minio/mc).

Its idea is to be able to synchronize a local directory (of any kind) with a remote one (of any kind) and to be 100 % sure that the performed changes are **precise**, **incremental** and **bidirectional**.

In my case the local directory is located on an APFS volume on my laptop, whereas the remote one is a folder in an S3-compatible bucket on a self-hosted MinIO server.

The MinIO Client utilities are used here to compare those 2 directories, to locate the unique & changed objects and to upload/download/remove the desired objects based on one's needs.

All collected information about the discovered objects is meant to be stored in a MySQL DB to keep track of the changes between sessions and to operate with the file/object trees efficiently.

![](https://github.com/awaytocloud/mc-sync-snapshot-20250428/blob/public/preview.png)
