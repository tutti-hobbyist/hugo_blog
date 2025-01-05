+++
title = 'WSL2+Ubuntu24.04+Docker+Cursorで作る深層学習環境'
subtitle = ""
date = 2025-01-04
lastmod = 2025-01-04
draft = true
KaTex = false
author = "Tuuutti"
authorLink = ""
description = ""
license = "MIT"
images = []
tags = ["Deep Learning", "WSL", "Docker"]
categories = ["Deep Learning"]
featuredImage = ""
featuredImagePreview = ""
isCJKLanguage = true
hiddenFromHomePage = false
hiddenFromSearch = false
twemoji = false
lightgallery = true
ruby = true
fraction = true
fontawesome = true
linkToMarkdown = true
rssFullText = false
+++

<!--more-->

## 前提
- IDEとGit for Windowsはインストール済み
- GitとGitHubはSSH接続（[公式ドキュメント](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)）

## 手順
### WSLのインストール
- WSL2を有効化
  - 「コントロールパネル」→「プログラム」→「Windowsの機能の有効化または無効化」を選択
  - 「Linux用Windowsサブシステム」と「仮想マシンプラットホーム」にチェックを入れてOKを選択
  - 再起動が求められるので再起動を実施
- [公式ドキュメント](https://learn.microsoft.com/ja-jp/windows/wsl/install)に従いインストール（以下コマンドは管理者権限で実行）
  - `wsl --update`：WSLのアップデート
  - `wsl --set-default-version 2`：WSL2をデフォルト設定
  - `wsl --list --online`：インストール可能なディストリビューションの確認
  - `wsl --install -d Ubuntu-24.04`：Ubuntu-24.04 のインストール
  - ユーザ名とパスワードの設定
  - `wsl -l -v`：インストールされているWSL2環境の一覧を表示（*はデフォルトのディストリビューション）
    ```text
      NAME              STATE           VERSION
    * docker-desktop    Running         2
      Ubuntu-24.04      Running         2
      Ubuntu-22.04      Stopped         2
    ```
  - `wsl --set-default Ubuntu-24.04`：Ubuntu-24.04をデフォルトに変更
    ```text
      NAME              STATE           VERSION
    * Ubuntu-24.04      Running         2
      docker-desktop    Running         2
      Ubuntu-22.04      Stopped         2
    ```
- WSLとHostのパス対応
  - WSL → Host：\mnt\c\Users\{username}
  - Host → WSL：\\wsl$\Ubuntu-24.04

### Nvidia Driverのインストール
- `nvidia-smi`：NVIDIA GPU の状態や情報を管理・監視するためのコマンド
- 以下のような表示がされた場合は、Driver はインストール済み
  ```text
  +-----------------------------------------------------------------------------------------+
  | NVIDIA-SMI 560.94                 Driver Version: 560.94         CUDA Version: 12.6     |
  |-----------------------------------------+------------------------+----------------------+
  | GPU  Name                  Driver-Model | Bus-Id          Disp.A | Volatile Uncorr. ECC |
  | Fan  Temp   Perf          Pwr:Usage/Cap |           Memory-Usage | GPU-Util  Compute M. |
  |                                         |                        |               MIG M. |
  |=========================================+========================+======================|
  |   0  NVIDIA GeForce RTX 4070 ...  WDDM  |   00000000:01:00.0  On |                  N/A |
  |  0%   28C    P8             16W /  285W |     891MiB /  16376MiB |      0%      Default |
  |                                         |                        |                  N/A |
  +-----------------------------------------+------------------------+----------------------+
  ```
- インストールされていなかった場合、[公式サイト](https://www.nvidia.com/ja-jp/drivers/)から合致する Driver をダウンロード

### Dockerのインストール
- 以下2つの方法がある（[参考動画](https://www.youtube.com/watch?v=6kCZJLZBVpQ)）
    - [Docker Desktop](https://docs.docker.com/desktop/setup/install/windows-install/)のインストール
    - [Docker Engine](https://docs.docker.com/engine/install/ubuntu/)をUbuntuにインストール
- `docker -v`：インストールバージョンの確認

### NVIDIA Dockerのインストール
- [nvidia-container-toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html#configuring-docker) のインストール
  > NVIDIA Container Toolkitを用いた場合、CUDA環境が用意されているdocker imageを使用すれば、ローカルのCUDAやCuDNNのインストールは不要
  - [aptでのインストール](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html#installing-with-apt)を実施
  - [Dockerの設定](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html#configuring-docker)を実施
- GPU（GeForce RTX 4070 Ti）に対応するCUDAバージョンの確認
  - Compute Capability：8.9
  - CUDA Version：12.6 (`nvidia-smi` の表示結果)
- コンテナの起動と動作確認
  - [DockerHub](https://hub.docker.com/r/pytorch/pytorch/tags)から確認したCUDAバージョンで使用可能なコンテナを選択
    - 2.5.1-cuda12.4-cudnn9-runtime
    - 2.5.1-cuda12.4-cudnn9-devel

    | 特徴          | `runtime`   | `devel`   |
    |-------|-----------|---------|
    | **目的**      | 実行環境を提供         | 開発・ビルド環境を提供|
    | **含まれるライブラリ**    | ランタイムライブラリのみ | ランタイム + 開発用ヘッダーやツール |
    | **イメージサイズ**        | 小さい      | 大きい    |
    | **適用場面**  | 本番環境や推論用        | 開発環境やビルドが必要な場合       |
  - sudo なしで Docker を使用できるよう、docker グループに現在のユーザーを追加  
    `sudo usermod -aG docker $USER`
  - 変更を反映するため、セッションを再読み込み  
    `newgrp docker`
  - 以下コマンドを実行  
    `docker run -it --gpus all pytorch/pytorch:2.5.1-cuda12.4-cudnn9-runtime`
    - `-i`：対話型（interactive）で標準入力を保持
    - `-t`：擬似ターミナルを割り当て
    - `--gpus all`：NVIDIA コンテナランタイムを使用してGPUを有効化し、ホストマシン上のすべてのGPUをコンテナに割り当て
  - コンテナのターミナルで以下を実行し、Trueであればコンテナ環境でGPUを使用可能
    ```shell
    root@c90e6b2dac1a:/workspace# python
    Python 3.11.10 | packaged by conda-forge | (main, Oct 16 2024, 01:27:36) [GCC 13.3.0] on linux
    Type "help", "copyright", "credits" or "license" for more information.
    >>> import torch
    >>> print(torch.cuda.is_available())
    True
    ```

### ホスト側のCursorからWSL内のコンテナでプログラム実行
- [Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) のインストール

## 参考情報
- [WSL2+Ubuntu24.04+Docker＋GPUでつくる機械学習環境](https://zenn.dev/yumizz/articles/627d4e4821c636)
- [GPUの型番にあったCUDAバージョンの選び方](https://zenn.dev/yumizz/articles/73d6c7d1085d2f)
