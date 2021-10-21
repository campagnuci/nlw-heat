import React from 'react'
import { Text, TouchableOpacity, View } from 'react-native'

import LogoSvg from '../../assets/logo.svg'
import { useAuth } from '../../hooks/auth'
import { UserPhoto } from '../UserPhoto'
import { styles } from './styles'

export function Header () {
  const { user, signOut } = useAuth()
  return (
    <View style={styles.container}>
      <LogoSvg />
      { user &&
        <View style={styles.logoutButton}>
          <TouchableOpacity onPress={signOut}>
            <Text style={styles.logoutText}>Sair</Text>
          </TouchableOpacity>

          <UserPhoto imageUri={user?.avatar_url} />
        </View>
      }
    </View>
  )
}
