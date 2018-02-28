{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_Pinyin (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/a/git-repos/aprather/project/Pinyin/.cabal-sandbox/bin"
libdir     = "/home/a/git-repos/aprather/project/Pinyin/.cabal-sandbox/lib/i386-linux-ghc-8.2.1/Pinyin-0.1.0.0-3dshjLM1gM3DBC5gH44ZLD"
dynlibdir  = "/home/a/git-repos/aprather/project/Pinyin/.cabal-sandbox/lib/i386-linux-ghc-8.2.1"
datadir    = "/home/a/git-repos/aprather/project/Pinyin/.cabal-sandbox/share/i386-linux-ghc-8.2.1/Pinyin-0.1.0.0"
libexecdir = "/home/a/git-repos/aprather/project/Pinyin/.cabal-sandbox/libexec/i386-linux-ghc-8.2.1/Pinyin-0.1.0.0"
sysconfdir = "/home/a/git-repos/aprather/project/Pinyin/.cabal-sandbox/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "Pinyin_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "Pinyin_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "Pinyin_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "Pinyin_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "Pinyin_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "Pinyin_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
