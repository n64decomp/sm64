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
        sh 'ln -s "$ROMS_DIR/Super Mario 64 - Shindou Edition (J) [!].z64" baserom.sh.z64'
        sh 'ln -s "$ROMS_DIR/Super Mario 64 - iQue (Ch).z64" baserom.cn.z64'
        // verify no assets were committed to repo
        sh '[ -z "$(find {actors,levels,textures}/ -name \'*.png\')" ]'
        sh '[ -z "$(find assets/ -name \'*.m64\' -or \'*.bin\')" ]'
        sh './extract_assets.py jp us eu sh cn'
      }
    }
    stage('Build US Source') {
      steps {
        sh 'make -j4 VERSION=us VERBOSE=1 COLOR=0'
      }
    }
    stage('Build SH Source') {
      steps {
        sh 'make -j4 VERSION=sh VERBOSE=1 COLOR=0'
      }
    }
    stage('Build EU Source') {
      steps {
        sh 'make -j4 VERSION=eu VERBOSE=1 COLOR=0'
      }
    }
    stage('Build JP Source') {
      steps {
        sh 'make -j4 VERSION=jp VERBOSE=1 COLOR=0'
      }
    }
    stage('Build CN Source') {
      steps {
        sh 'make -j4 VERSION=cn VERBOSE=1 COLOR=0 COMPARE=0'
      }
    }
    stage('Test Enhancements') {
      steps {
        sh '''
          set -e
          for f in enhancements/*.patch
          do
            git clean -fd .
            git checkout -- .
            echo 'y' | tools/apply_patch.sh "$f"
            make -j4 VERSION=us COMPARE=0 VERBOSE=1
          done
        '''
      }
    }
  }
  environment {
    QEMU_IRIX = credentials('qemu-irix')
    ROMS_DIR = credentials('roms')
  }
}
