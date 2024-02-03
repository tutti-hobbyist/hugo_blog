+++
title = 'HDF5の概要'
subtitle = ""
date = 2024-01-30
lastmod = 2024-01-30
draft = false
author = "Tuuutti"
authorLink = ""
description = ""
license = "MIT"
images = []
tags = ["HDF5", "Python"]
categories = ["HDF5"]
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

### HDF5の特徴
- 汎用バイナリ形式 (言語非依存)
- ファイル中に階層構造を保持
- 種々のデータを保存可能
- メタデータを格納
- データの部分読込みが可能 (メモリ使用量低減)
- 部分更新可能なため、ファイル圧縮も容易 (データセットをchunkに分割)
- クロスプラットフォーム対応
- pickleより若干IOが遅いが、csvと比べるとかなり高速
<br>

### 階層構造
- Group (Dict) : ディレクトリ
- Dataset (ndarray): ファイル
- Attribute: プロパティ
<br>

### Pythonコード (読込み)

```Python
FILE_PATH = "hoge.hdf5"

# hdf5を読込み、Datasetを出力する関数
def read_hdf5(file_path):

    # Datasetを出力する関数
    def print_data(name, obj):
        if isinstance(obj, h5py.Dataset):
            print(f"========= {name} =========", "\n", obj[...], "\n")
            for key, value in obj.attrs.items():
                print(f"{key}: {value}")   # Datasetにattributeがあればそれも表示

    # hdf5を読込むwith文
    with h5py.File(file_path, "r") as f:
        f.visititems(print_data)

if __name__ == "__main__":
    read_hdf5(FILE_PATH)
```

<br>

### Pythonコード (書込み)

```Python
FILE_PATH = "hoge.hdf5"

# hdf5を作成するwith文
with h5py.File(file_path, "w") as f:
    arr1 = np.random.random(size=(10, 10))
    arr2 = np.random.random(size=(20, 20))

    group1 = f.create_group("group1")
    dataset1 = group1.create_dataset(name="dataset1", data=arr1, compression="gzip)
    dataset2 = f.create_dataset(name="group2/dataset2", data=arr2)
    dataset2[0,0] = 1
    dataset2.attrs['description'] = 'TEST'
    dataset2.attrs['id'] = 1234
```

<br>

### 参考情報
- [HDF5 for Python](https://docs.h5py.org/en/stable/)
- [Pythonを使いHDFファイルの階層構造を把握してデータを読み込む](https://qiita.com/skotaro/items/873507dc8f8f967bbc03#fnref5)
- [意外と奥が深い、HDFの世界](https://qiita.com/simonritchie/items/23db8b4cb5c590924d95)
