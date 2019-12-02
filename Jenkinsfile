pipeline {
  agent any
  stages {
    stage('Build Tools') {
      steps {
        sh 'make -j4 -C tools/'
      }
    }
    stage('Extract Assets') {
      steps {
        sh 'ln -s "$ROMS_DIR/Super Mario 64 (J) [!].z64" baserom.jp.z64'
        sh 'ln -s "$ROMS_DIR/Super Mario 64 (U) [!].z64" baserom.us.z64'
        sh 'ln -s "$ROMS_DIR/Super Mario 64 (E) (M3) [!].z64" baserom.eu.z64'
        // verify no assets were committed to repo
        sh '[ -z "$(find {actors,levels,textures}/ -name \'*.png\')" ]'
        sh '[ -z "$(find assets/ -name \'*.m64\' -or \'*.bin\')" ]'
        sh './extract_assets.py jp us eu'
      }
    }
    stage('Build J Source') {
      steps {
        sh 'make -j4 VERSION=jp'
      }
    }
    stage('Build U Source') {
      steps {
        sh 'make -j4 VERSION=us'
      }
    }
  }
  environment {
    QEMU_IRIX = credentials('qemu-irix')
    ROMS_DIR = credentials('roms')
  }
}
