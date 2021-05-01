# github-action-push-tag-to-tag
Github action to push tag on another tag.
You can use it to mark some git tag (version) as deployed on server (our case).
ExistingTag is optional - if you don`t use it, new tag will be on origin/HEAD 

## Example usage
```yaml
      - name: Push tag
        uses: daviduhlir/github-action-push-tag-to-tag
        env:
          API_TOKEN_GITHUB: ${{ secrets.API_TOKEN_GITHUB }}
        with:
          destination-github-username: daviduhlir
          destination-repository-name: github-action-push-tag-to-tag
          user-email: githubaction@yourdomain.com
          new-tag: Deployed
          existing-tag: v1.0
```
